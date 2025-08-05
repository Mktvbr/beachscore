import prisma from '@/lib/prisma';
import Link from 'next/link';
import Image from 'next/image';


export default async function FutevoleiFeed() {

    const posts = await prisma.postVolei.findMany({
        orderBy: { createdAt: 'desc' },
    });




    return (
        <main className="flex w-full h-auto justify-center overflow-y-auto overflow-x-auto break-words">
            <div className="flex flex-col w-full h-full max-w-4xl items-center bg-orange-300 shadow-xl p-5 z-10">
                <h1 className="text-2xl font-bold mb-4">Futevôlei</h1>
                {posts.length === 0 ? (
                    <p className="text-lg mb-6">Nenhum post encontrado.</p>
                ) : (

                    posts.map(post => (
                        <Link href={`/volei/${post.id}`} key={post.id} className="w-full">
                            <div key={post.id} className="flex flex-col sm:flex-row w-full p-4 rounded-lg mb-4 shadow bg-white">
                                {post.picture && (
                                    <img
                                        src={post.picture}
                                        alt={post.title}
                                        className="w-full sm:w-40 h-auto object-cover rounded mb-4 sm:mb-0"
                                    />
                                )}

                                <div className="sm:ml-4 flex flex-col justify-between">
                                    <h2 className="text-lg sm:text-xl font-semibold text-amber-900">{post.title}</h2>

                                    <div
                                        className="text-sm text-gray-700 mt-2"
                                        dangerouslySetInnerHTML={{ __html: post.description ?? '' }}
                                    />

                                    <p className="text-xs text-gray-500 mt-4">
                                        Publicado em: {new Date(post.createdAt).toLocaleDateString()}
                                    </p>
                                </div>
                            </div>
                        </Link>
                    ))
                )}

                {/* <img src="/images/futevolei.jpg" alt="Futevôlei" className="w-full h-auto rounded-lg shadow-md" /> */}
            </div>
        </main>
    );


}
