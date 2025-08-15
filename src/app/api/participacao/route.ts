import { NextResponse } from 'next/server';
import prisma from '@/lib/prisma';

export async function POST(req: Request) {
    try {
        const body = await req.json();
        const {
            jogadorId,
            campeonatoId
        } = body;

        if (!jogadorId || !campeonatoId) {
            return NextResponse.json({ error: 'Jogador e campeonato são obrigatórios' }, { status: 400 });
        }

        // Verifica se o jogador existe
        const jogadorExiste = await prisma.jogador.findUnique({ where: { id: jogadorId } });
        if (!jogadorExiste) {
            return NextResponse.json({ error: 'Jogador não encontrado' }, { status: 404 });
        }

        // Verifica se o campeonato existe
        const campeonatoExiste = await prisma.campeonato.findUnique({ where: { id: campeonatoId } });
        if (!campeonatoExiste) {
            return NextResponse.json({ error: 'Campeonato não encontrado' }, { status: 404 });
        }

        const participacao = await prisma.participacao.create({
            data: {
                jogador: {
                    connect: { id: jogadorId }
                },
                campeonato: {
                    connect: { id: campeonatoId }
                }
            }
        });

        return NextResponse.json(participacao);
    } catch (error) {
        console.error('Error creating participation:', error);
        return NextResponse.json({ error: 'Failed to create participation' }, { status: 500 });
    }
}
