import { PrismaAdapter } from '@auth/prisma-adapter';
import Google from "next-auth/providers/google"
import prismaClient from './prisma';
import { AuthOptions } from 'next-auth';

export const authOptions: AuthOptions = {
    adapter: PrismaAdapter(prismaClient),
    providers: [
        Google({
            clientId: process.env.GOOGLE_CLIENT_ID as string,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET as string,
        })
    ],
    callbacks: {
        async session({ session,token, user }) {
            session.user = {
                ...session.user,
                id:user.id,
                role: (user as { role?: string }).role ?? "user"

            } as { 

                id: string;
                name: string;
                email: string;
                role: string;
            }
            return session;
        }
    }
}