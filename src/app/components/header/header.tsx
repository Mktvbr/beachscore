'use client';

import Image from "next/image";
import Link from "next/link";
import {FiUser, FiLogOut, FiSettings} from "react-icons/fi"; 
import { GiExitDoor } from "react-icons/gi";
import {signIn, signOut, useSession} from "next-auth/react";

export default function Header() {
  const {status, data} = useSession()

  async function handleLogin() {
    await signIn()
  }

  async function handlelogout() {
    await signOut()
  }

  return (
    <header className="flex flex-row justify-between items-center w-full h-20 bg-orange-300 shadow-xl p-4 border-b-amber-950 border-b-1 z-10">
      <div className="flex items-center">
        <Image
          src="/logoestendida.png"
          alt="BeachScore" 
          width={190}
          height={100}
          priority
          quality={100} 
          />
      </div>
     
      {status === "authenticated" ? (
        <nav className="flex space-x-4">
        <Link href="/admin" className="text-lg hover:text-orange-500">
        <FiUser size={26} color="#1c1917"/>
        </Link>

        <Link href="/configuracoes" className="text-lg hover:text-orange-500" title="Configurações" aria-label="Configurações">
          <FiSettings size={30} color="#1c1917"/>
        </Link>
        <button
          onClick={handlelogout}
          className="text-lg hover:text-orange-500"
          title="deslogar"
          aria-label="deslogar"
        >
          <GiExitDoor size={30} color="#f11"/>
        </button>
        </nav>

        ) : (
          <nav className="flex space-x-4">
          <button
            onClick={handleLogin}
            className="curor-point shadow-lg flex flex-col justify-center items-center rounded-xl p-2 hover:bg-orange-500"
            title="Login"
            aria-label="Login"
          >
            <h1 className="text-amber-950 text-3xl font-extrabold tracking-wide">Login</h1>
          </button>
          </nav>
        )}
    </header>
  );
}