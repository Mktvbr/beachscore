import { NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function POST(req: Request) {
    try {
        const body = await req.json();
        const {
            title,
            picture,
            description,
            content,
            published = false,
            authorId
        } = body;

        if (!title) {
            return NextResponse.json({ error: 'Título é obrigatório' }, { status: 400 });
        }

        if (!description) {
            return NextResponse.json({ error: 'A descrição é obrigatória' }, { status: 400 });
        }

        const newPost = await prisma.postVolei.create({
            data: {
                title,
                picture,
                description,
                content,
                published,
                authorId,
            },
        });

        return NextResponse.json(newPost, { status: 201 });
    } catch (error) {
        console.error('Erro ao criar post de vôlei:', error);
        return NextResponse.json({ error: 'Erro interno no servidor' }, { status: 500 });
    }
}
