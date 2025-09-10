'use client';
import React, { useEffect, useRef } from 'react';
import 'quill/dist/quill.snow.css';

interface DescriptionProps {
    biography: string;
    sourceBiography: (value: string) => void;
    placeholder?: string;
}

export default function Biography({ biography, placeholder, sourceBiography }: DescriptionProps) {
    const editorRef = useRef<HTMLDivElement>(null);


    useEffect(() => {
        if (typeof window === "undefined" || !editorRef.current) return;

        let quill: any
        let mounted = true;

        (async () => {
            const Quill = (await import('quill')).default;
            if (!mounted) return;
            quill = new Quill(editorRef.current!, {
                theme: 'bubble',
                placeholder: placeholder || 'Adicione sua descrição',
                modules: {
                    toolbar: false, 
                },
            })


            if (biography && quill.root.innerHTML !== biography) {
                quill.clipboard.dangerouslyPasteHTML(biography);
            }

            quill.on('text-change', () => {
                const htmlValue = quill.root.innerHTML;
                sourceBiography(htmlValue);
            });
        })()

        return () => {
            mounted = false;
        };
    }, [sourceBiography]);

    return (
        <div className='w-full h-auto p-0 bg-white rounded-lg shadow-md mt-4'>
            <div ref={editorRef} />
        </div>
    );
}