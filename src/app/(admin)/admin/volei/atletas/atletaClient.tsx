'use client';

import EditorBloco from "@/app/components/editorAtleta/editor";
import { useState } from "react";
import { Button } from 'primereact/button';
import { campeonatoService } from "@/services";
import { useSession } from "next-auth/react";


export default function AtletaClient() {

    // Obtém os dados da sessão atual do usuário logado com NextAuth
    // "data" é renomeado para "session" para facilitar o uso
    const { data: session } = useSession();

    const [content, setContent] = useState('');
    const [title, setTitle] = useState('');
    const [picture, setPicture] = useState('');
    const [birthDate, setBirthDate] = useState('');
    const [from, setFrom] = useState('');
    const [position, setPosition] = useState('');
    const [ranking, setRanking] = useState('');
    const [name, setName] = useState('');
    const [biography, setBiography] = useState('');
    const [description, setDescription] = useState('');

    // Função usada para receber o conteúdo do editor e atualizar o estado 'content'
    const sourceData = (data: any) => {
        setContent(data);
    }

    // Função usada para receber o título e atualizar o estado 'title'
    const sourceTitle = (title: any) => {
        setTitle(title);
    }

    const sourcePicture = (picture: any) => {
        setPicture(picture);
    }

    const sourceBiography = (biography: any) => {
        setBiography(biography);
    }

    const sourceDescription = (description: any) => {
        setDescription(description);
    }

    // Função assíncrona que será chamada ao clicar no botão 'Salvar'
    const handleSubmit = async () => {

        //monta o corpo da requisição com os dados do post
        const body = {
            name: name,
            content: content,
            picture: picture,
            biography: biography,
            description: description,
            birthDate: birthDate,
            from: from,
            position: position,
            ranking: ranking,
            published: false,
            authorId: session?.user.id
        }

        // Chama o serviço responsável por salvar o post no banco de dados
        const result = await campeonatoService(body)

        // Verifica se a resposta foi bem-sucedida e limpa o editor após salvo
        if (result) {
            setTitle('');
            setContent('');
            alert('Post salvo com sucesso!');
            window.location.reload()
        } else {
            alert('Erro ao salvar o post.');
        }

    }


    return (
        <>
            <main className="flex w-full items-center justify-center">
                <div className="flex flex-col w-170 items-center bg-orange-300  shadow-xl pt-0 p-5 z-10 ">
                    <EditorBloco
                        content={content}
                        title={title}
                        picture={picture}
                        description={description}
                        biography={biography}
                        birthDate={birthDate}
                        from={from}
                        position={position}
                        ranking={ranking}
                        sourceBiography={setBiography}
                        sourceData={setContent}
                        sourceName={setName}
                        sourcePicture={setPicture}
                        sourceDescription={setDescription}
                        sourceBirthDate={setBirthDate}
                        sourceFrom={setFrom}
                        sourcePosition={setPosition}
                        sourceRanking={setRanking}
                    />
                    <div className="flex justify-center  items-center mt-4">
                        <Button
                            label="Salvar"
                            className="curor-point shadow-lg flex flex-col w-full justify-center items-center rounded-xl p-2 hover:bg-orange-500"
                            onClick={handleSubmit}
                        />
                    </div>
                </div>
            </main>
        </>
    )
}