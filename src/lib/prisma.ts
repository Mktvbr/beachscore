import { PrismaClient } from "../generated/prisma/client";

let prisma: PrismaClient;

if(process.env.NODE_ENV === "production") {
  prisma = new PrismaClient();
}else {
    let globalWithPrisma = global as typeof globalThis & {
        _prisma: PrismaClient
    }

    if(!globalWithPrisma._prisma) {
        globalWithPrisma._prisma = new PrismaClient
    }

    prisma = globalWithPrisma._prisma
}

export default prisma