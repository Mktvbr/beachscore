import { NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function POST(req: Request) {
    try {
        const body = await req.json();
        const {
            name,
            date,
            location,
            sport,
            picture,
            description
        } = body;

        if (!name) {
            return NextResponse.json({ error: 'o nome é obrigatório' }, { status: 400 });
        }

        if (!description) {
            return NextResponse.json({ error: 'A descrição é obrigatória' }, { status: 400 });
        }

        if (!date) {
            return NextResponse.json({ error: 'A data é obrigatória' }, { status: 400 });
        }

        if (!location) {
            return NextResponse.json({ error: 'O local é obrigatório' }, { status: 400 });
        }

        if (!sport) {
            return NextResponse.json({ error: 'O esporte é obrigatório' }, { status: 400 });
        }
        const newCampeonato = await prisma.campeonato.create({
            data: {
                name,
                date: new Date(date),
                location,
                sport,
                picture,
                description
            },
        });

        return NextResponse.json(newCampeonato, { status: 201 });
    } catch (error) {
        console.error('Erro ao criar campeonato:', error);
        return NextResponse.json({ error: 'Erro interno no servidor' }, { status: 500 });
    }
}
