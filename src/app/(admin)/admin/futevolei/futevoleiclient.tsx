'use client';

import EditorBloco from "@/app/components/editor/editor";
import { useState } from "react";
import { Button } from 'primereact/button';
import { futevoleiService } from "@/services";
import { useSession } from "next-auth/react";


export default function FutevoleiClient() {

    // Obtém os dados da sessão atual do usuário logado com NextAuth
    // "data" é renomeado para "session" para facilitar o uso
    const { data: session } = useSession() 

    const [content, setContent] = useState('')
    const [title, setTitle] = useState('')
    const [picture, setPicture] = useState('')

    // Função usada para receber o conteúdo do editor e atualizar o estado 'content'
    const sourceData = (data: any) => {
        setContent(data)
    }

    // Função usada para receber o título e atualizar o estado 'title'
    const sourceTitle = (title: any) => {
        setTitle(title)
    }

    const sourceThumbnail = (thumbnail: any) => {
        setPicture(thumbnail)
    }

    // Função assíncrona que será chamada ao clicar no botão 'Salvar'
    const handleSubmit = async () => {

        //monta o corpo da requisição com os dados do post
        const body = {
            title: title,
            content: content,
            picture: picture,
            published: false,
            authorId: session?.user.id
        }

        // Chama o serviço responsável por salvar o post no banco de dados
        const result = await futevoleiService(body)

        // Verifica se a resposta foi bem-sucedida e limpa o editor após salvo
        if (result) {
            setTitle('')
            setContent('')
            alert('Post salvo com sucesso!')
            window.location.reload()
        } else {
            alert('Erro ao salvar o post.')
        }

    }


    return (
        <>
            <main className="flex w-full items-center justify-center">
                <div className="flex flex-col w-200 items-center bg-orange-300  shadow-xl pt-0 p-5 z-10">
                    <EditorBloco
                        content={content}
                        title={title}
                        picture={picture}
                        sourceThumbnail={setPicture}
                        sourceData={setContent}
                        sourceTitle={setTitle}
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