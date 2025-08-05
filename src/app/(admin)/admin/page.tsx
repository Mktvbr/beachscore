import Header from "@/app/(admin)/components/header/header";
import Image from "next/image";
import Link from "next/link";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/auth";
import { Session } from "next-auth";

export default async function Admin() {
    const session = await getServerSession(authOptions);
    
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
    <>

    <main className="flex w-full h-screen items-center justify-center overflow-hidden ">
        <div className="flex flex-col w-150 h-full justify-center items-center bg-orange-300  shadow-xl pt-0 p-5 z-10">

            <h1 className="text-2xl font-bold">Admin Panel</h1>

            <div className="flex flex-row gap-8 pb-5">
                
                <Link href='/admin/volei' className="flex flex-col items-center rounded-xl shadow-xl p-2 hover:bg-orange-500" >
                    <Image src="/volei.png" alt="Volei de Praia" width={150} height={150} />
                    Volei de Praia
                </Link>

                <Link href="#" className="flex flex-col items-center rounded-xl shadow-xl p-2 hover:bg-orange-500">
                    <Image src="/soccer.png" alt="Beach Soccer" width={150} height={150} />
                    Beach Soccer
                </Link>

                <Link href='/admin/futevolei'className="flex flex-col items-center rounded-xl shadow-xl p-2 hover:bg-orange-500">
                    <Image src="/futevolei.png" alt="Futevolei" width={150} height={150} />
                    Futevolei
                </Link>
            </div>

        </div>
    </main>
    </>
  );
}