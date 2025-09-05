'use client';
import React from "react";
import { Editor } from "primereact/editor";
import { InputText } from 'primereact/inputtext';
import Thumbnails from "../thumbnails/thumbnails";
import Description from "../description/index"
import axios, {AxiosResponse} from "axios";
import './styles/quillFix.css';

// Define a interface para os props que o componente EditorBloco irá receber
interface EditorBlocoProps {
    content: string;
    title: string;
    picture: string;
    biography: string;
    description: string;
    birthDate: string;
    from: string;
    position: string;
    ranking: string;
    sourceBirthDate: (value: string) => void; // Função para atualizar a data de nascimento no componente pai
    sourceFrom: (value: string) => void; // Função para atualizar o local de origem no componente pai
    sourcePosition: (value: string) => void; // Função para atualizar a posição no componente pai
    sourceRanking: (value: string) => void; // Função para atualizar o ranking no componente pai
    sourceData: (value: string) => void; // Função para atualizar o conteúdo no componente pai em tempo real para o usuário
    sourceName: (value: string) => void; // Função para atualizar o conteúdo no componente pai em tempo real para o usuário
    sourcePicture: (value: string) => void; // Função para atualizar a miniatura no componente pai
    sourceBiography: (value: string) => void; // Função para atualizar a biografia no componente pai
    sourceDescription: (value: string) => void; // Função para atualizar a descrição no componente pai
    
}

// Componente principal que representa o editor de texto e campo de título
export default function EditorBloco({ sourceData, sourceDescription, sourceBiography, sourceName, sourcePicture, content,
    title, picture, biography, description }: EditorBlocoProps) {
        

    //função que envia o conteúdo para a api
    const handleSave = async () => {
        const res = await axios.post('/api/salvarTexto', {
            headers: { 'Content-Type': 'application/json' },
            data: { 
                biography: biography,
                description: description,
            }
            
        });
    }


    return (
        <div className="card p-4 space-y-4 flex flex-col justify-center items-center overflow-x-auto break-words" >
            <label className="block font-serif font-bold text-amber-950">Título</label>
            <InputText
                value={title}
                onChange={(e) => sourceName(e.target.value)}
                type="text"
                placeholder="Digite o título do post"
                className="w-full bg-white border border-gray-300 rounded-lg p-2 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"
            />

            <label className="block font-serif font-bold text-amber-950 mt-6">Miniatura</label>
            <Thumbnails
                picture={picture}
                sourceThumbnail={sourcePicture}
            />


            <label className="block font-serif font-bold text-amber-950 mt-6">Descrição</label>
            <Description
                description={description}
                sourceDescription={sourceDescription}
            />

            <label className="block font-serif font-bold text-amber-950 mt-6">Biografia</label>
            <Description
                biography={biography}
                sourceBiography={sourceBiography}
            />

            <label className="block font-semibold m-4 text-amber-950">Conteúdo</label>
            <Editor
                value={content}
                onTextChange={(e) => sourceData(e.htmlValue ?? '')}
                style={{ height: '320px' }}
                className="bg-white border border-gray-300 rounded-lg"
            />
        </div>
    )
}
