const axios = require('axios');

export const voleiService = async (body:any) => {
    try {
        const response = await axios.post('/api/volei',body,{
            headers: { 'Content-Type': 'application/json' }
        })

        return response;

    }catch (error) {
        console.error('Erro no serviço de vôlei:', error);
        throw new Error('Erro ao processar a solicitação de vôlei');
    }

}

export const futevoleiService = async (body:any) => {
    try {
        const response = await axios.post('/api/futevolei',body,{
            headers: { 'Content-Type': 'application/json' }
        })


        return response;


    }catch (error) {
        console.error('Erro no serviço de futevôlei:', error);
        throw new Error('Erro ao processar a solicitação de vôlei');
    }

}

export const beachsoccerService = async (body:any) => {
    try {
        const response = await axios.post('/api/beachsoccer',body,{
            headers: { 'Content-Type': 'application/json' }
        })

        return response;

    }catch (error) {
        console.error('Erro no serviço de beachsoccer:', error);
        throw new Error('Erro ao processar a solicitação de beachsoccer');
    }

}