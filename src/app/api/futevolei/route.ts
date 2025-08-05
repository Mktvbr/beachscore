import { NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function POST(req: Request) {
    try {
        const body = await req.json();
        const {
            title,
            content,
            picture,
            description, 
            published = false,
            authorId
    } = body;

    if (!title) {
        return NextResponse.json({ error: 'Título é obrigatório' }, { status: 400 });
    }

    const newPost = await prisma.postfutevolei.create({
        data: {
            title,
            content,
            picture,
            description,
            published,
            authorId,
        },
    });

    return NextResponse.json(newPost, { status: 201 });
    } catch (error) {
        console.error('Erro ao criar post de futevolei:', error);
        return NextResponse.json({ error: 'Erro interno no servidor' }, { status: 500 });
    }
}
