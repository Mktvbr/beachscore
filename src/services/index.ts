export const voleiService = async (body:any) => {
    try {
        const response = await fetch('/api/volei',{
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(
                body
            ),
        })

        return response;

    }catch (error) {
        console.error('Erro no serviço de vôlei:', error);
        throw new Error('Erro ao processar a solicitação de vôlei');
    }

}

export const futevoleiService = async (body:any) => {
    try {
        const response = await fetch('/api/futevolei',{
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(
                body
            ),
        })


        return response;


    }catch (error) {
        console.error('Erro no serviço de futevôlei:', error);
        throw new Error('Erro ao processar a solicitação de vôlei');
    }

}

export const beachsoccerService = async (body:any) => {
    try {
        const response = await fetch('/api/beachsoccer',{
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(
                body
            ),
        })

        return response;

    }catch (error) {
        console.error('Erro no serviço de beachsoccer:', error);
        throw new Error('Erro ao processar a solicitação de beachsoccer');
    }

}