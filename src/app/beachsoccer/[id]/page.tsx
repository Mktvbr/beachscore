import prisma from "@/lib/prisma";

async function fetchPosts(id: string) {
    const posts = await prisma.postSoccer.findUnique({
        where: {
            id: id
        }
    });
    return posts;
}

export default async function Volei(
    {params}: { params: { id: string } }
){
    const post = await fetchPosts(params.id);
    return (
        <main className="flex w-full h-auto justify-center overflow-y-auto overflow-x-auto break-words">
            <div className="flex flex-col w-full h-full max-w-4xl items-center bg-orange-300 shadow-xl overflow-x-auto break-words pl-15 pr-15 z-10">
                <h1 className="text-2xl font-bold w-full break-words overflow-x-auto prose max-w-none pt-7">{post?.title}</h1>
                <div dangerouslySetInnerHTML={{ __html: post?.content ?? '' }}
                className="text-lg mt-4 mb-6 w-full break-words overflow-x-auto prose max-w-none pt-5" />
            </div>
        </main>
    )
}