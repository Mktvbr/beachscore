import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import VoleiClient from "./voleiclient";

export default async function VoleiPost() {

  // Obtém a sessão do usuário autenticado no lado do servidor definidas em `authOptions`
  const session = await getServerSession(authOptions);

  //verifica se o usuário está logado ou se ele é um administrador através do role
    if (!session || session.user.role !== "admin") {
      return (
          <main className="flex w-full h-screen items-center justify-center overflow-hidden ">
          <div className="flex flex-col items-center justify-center w-xl h-screen bg-orange-300">
              <h1 className="text-2xl font-bold">Acesso Negado!</h1>
              <p className="text-lg">Você não tem permissão para acessar esta página.</p>
          </div>
          </main>
      );
  }

    return (
    <main className="flex w-full min-h-screen items-center justify-center overflow-y-auto">
      <div className="flex flex-col w-full max-w-4xl items-center bg-orange-300 shadow-xl p-5 z-10">
        <VoleiClient />
      </div>
    </main>
  );


}
