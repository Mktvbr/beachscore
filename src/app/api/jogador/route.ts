import { NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function POST(req: Request) {
    try {
        const body = await req.json();
        const {
            id,
            name,
            birthDate,
            from,
            position,
            ranking,
            biography,
            picture,
            titulos,
            createdAt,
            updatedAt
        } = body;

        if (!name) {
            return NextResponse.json({ error: 'Nome é obrigatório' }, { status: 400 });
        }

        if (!biography) {
            return NextResponse.json({ error: 'A biografia é obrigatória' }, { status: 400 });
        }

        const newJogador = await prisma.jogador.create({
            data: {
                id,
                name,
                birthDate: new Date(birthDate),
                from,
                position,
                ranking,
                biography,
                picture,
                titulos,
                createdAt,
                updatedAt,
            },
        });

        return NextResponse.json(newJogador, { status: 201 });
    } catch (error) {
        console.error('Erro ao criar jogador:', error);
        return NextResponse.json({ error: 'Erro interno no servidor' }, { status: 500 });
    }
}
