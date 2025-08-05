import Image from "next/image";
import Link from "next/link";

export default function Home() {
  return (
    <main className="flex w-full h-screen items-center justify-center overflow-hidden">
      <Image
        src="/background.jpg"
        alt="BeachScore"
        fill
        priority
        sizes="100vw"
        quality={100}
        className=" absolute inset-0 object-cover opacity-10 "
      />
      <div className="flex flex-col w-full h-full sm:w-150 sm:h-120 justify-center items-center bg-orange-300 sm:rounded-xl shadow-xl pt-0 p-5 z-10">
        <Image
          src="/logo.png"
          alt="BeachScore"
          width={300}
          height={300}
          quality={100}
        />
        <div className="flex flex-row gap-8 pb-5">

          <Link href='/volei'>
            <button
              className="flex flex-col items-center cursor-pointer rounded-xl shadow-xl p-2 hover:bg-orange-500"
              type="button"
            >
              <Image
                src="/volei.png"
                alt="Volei de Praia"
                width={150}
                height={150}
              />
              Volei de Praia
            </button>
          </Link>
          <Link href='/beachsoccer'>
            <button 
            className="flex flex-col items-center cursor-pointer rounded-xl shadow-xl p-2 hover:bg-orange-500	"
            type="button"
            >
              <Image
                src="/soccer.png"
                alt="Beach Soccer"
                width={150}
                height={150}
              />
              Beach Soccer
            </button>
          </Link>
          <Link href='/futevolei'>
            <button 
            className="flex flex-col items-center cursor-pointer rounded-xl shadow-xl p-2 hover:bg-orange-500"
            type="button"
            >
              <Image
                src="/futevolei.png"
                alt="Futevolei"
                width={150}
                height={150}
              />
              Futevolei
            </button>
          </Link>
        </div>
      </div>

    </main>
  );
}
