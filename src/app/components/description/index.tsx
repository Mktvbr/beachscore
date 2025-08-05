'use client';
import React, { useEffect, useRef } from 'react';
import 'quill/dist/quill.snow.css';

interface DescriptionProps {
    description: string;
    sourceDescription: (value: string) => void;
    placeholder?: string;
}

export default function Description({ description, placeholder, sourceDescription }: DescriptionProps) {
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


            if (description && quill.root.innerHTML !== description) {
                quill.clipboard.dangerouslyPasteHTML(description);
            }

            quill.on('text-change', () => {
                const htmlValue = quill.root.innerHTML;
                sourceDescription(htmlValue);
            });
        })()

        return () => {
            mounted = false;
        };
    }, [sourceDescription]);

    return (
        <div className='w-full h-auto p-0 bg-white rounded-lg shadow-md mt-4'>
            <div ref={editorRef} />
        </div>
    );
}