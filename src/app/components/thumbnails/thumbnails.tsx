'use client';
import React, { useEffect, useRef } from 'react';
import 'quill/dist/quill.snow.css';
import styles from './thumbnails.module.css';

interface ThumbnailsProps {
    picture: string;
    sourceThumbnail: (value: string) => void;
    placeholder?: string;
}

export default function Thumbnails({ picture, sourceThumbnail, placeholder }: ThumbnailsProps) {
    const editorRef = useRef<HTMLDivElement>(null);
    const fileInputRef = useRef<HTMLInputElement>(null);

    const handleImageUpload = (file: File) => {
        const reader = new FileReader();
        reader.onloadend = () => {
            sourceThumbnail(reader.result as string);
        };
        reader.readAsDataURL(file);
    };

    useEffect(() => {
        if (typeof window === "undefined" || !editorRef.current) return;

        let quill: any;
        let mounted = true;

        (async () => {
            const Quill = (await import('quill')).default;
            if (!mounted) return;
            quill = new Quill(editorRef.current!, {
                theme: 'snow',
                placeholder: placeholder || 'Adicione sua miniatura clicando no ícone acima...',
                modules: {
                    toolbar: {
                        container: [['image']],
                        handlers: {
                            image: () => fileInputRef.current?.click(),
                        },
                    },
                },
            });
        })();

        return () => {
            mounted = false;
        };
    }, [placeholder]);

    return (
        <div className='w-full h-auto p-0 bg-white rounded-lg shadow-md mt-4'>
            <label htmlFor="thumbnail-upload" className="sr-only">
                Selecionar imagem para thumbnail
            </label>
            <input
                id="thumbnail-upload"
                type="file"
                accept="image/*"
                className={styles.hiddenInput}
                ref={fileInputRef}
                title="Selecionar imagem para thumbnail"
                onChange={e => {
                    const file = e.target.files?.[0];
                    if (file) handleImageUpload(file);
                }}
            />

            <div ref={editorRef} />

            {picture && (
                <div className="mt-4 flex justify-center">
                    <img
                        src={picture}
                        alt="Thumbnail selecionada"
                        className="max-h-48 rounded shadow"
                    />
                </div>
            )}
        </div>
    );
}