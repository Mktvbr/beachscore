[33mcommit fbfa85454403be9c5556a9d5d2b5981cbf5ea266[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m, [m[1;31morigin/main[m[33m)[m
Author: Mktvbr <mateusluizsr@hotmail.com>
Date:   Thu Aug 7 15:18:16 2025 -0300

    Refatoração de layout e melhorias: correção de erro de hidratação e ajustes nos serviços com Axios

[1mdiff --git a/src/app/(admin)/admin/futevolei/futevoleiclient.tsx b/src/app/(admin)/admin/futevolei/futevoleiclient.tsx[m
[1mindex 434735c..c9d6637 100644[m
[1m--- a/src/app/(admin)/admin/futevolei/futevoleiclient.tsx[m
[1m+++ b/src/app/(admin)/admin/futevolei/futevoleiclient.tsx[m
[36m@@ -13,22 +13,27 @@[m [mexport default function FutevoleiClient() {[m
     // "data" é renomeado para "session" para facilitar o uso[m
     const { data: session } = useSession() [m
 [m
[31m-    const [content, setContent] = useState('')[m
[31m-    const [title, setTitle] = useState('')[m
[31m-    const [picture, setPicture] = useState('')[m
[32m+[m[32m    const [content, setContent] = useState('');[m
[32m+[m[32m    const [title, setTitle] = useState('');[m
[32m+[m[32m    const [picture, setPicture] = useState('');[m
[32m+[m[32m    const [description, setDescription] = useState('');[m
 [m
     // Função usada para receber o conteúdo do editor e atualizar o estado 'content'[m
     const sourceData = (data: any) => {[m
[31m-        setContent(data)[m
[32m+[m[32m        setContent(data);[m
     }[m
 [m
     // Função usada para receber o título e atualizar o estado 'title'[m
     const sourceTitle = (title: any) => {[m
[31m-        setTitle(title)[m
[32m+[m[32m        setTitle(title);[m
     }[m
 [m
     const sourceThumbnail = (thumbnail: any) => {[m
[31m-        setPicture(thumbnail)[m
[32m+[m[32m        setPicture(thumbnail);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const sourceDescription = (description: any) => {[m
[32m+[m[32m        setDescription(description);[m
     }[m
 [m
     // Função assíncrona que será chamada ao clicar no botão 'Salvar'[m
[36m@@ -38,7 +43,8 @@[m [mexport default function FutevoleiClient() {[m
         const body = {[m
             title: title,[m
             content: content,[m
[31m-            picture: picture,[m
[32m+[m[32m            picture: picture,[m[41m [m
[32m+[m[32m            description: description,[m
             published: false,[m
             authorId: session?.user.id[m
         }[m
[36m@@ -67,9 +73,11 @@[m [mexport default function FutevoleiClient() {[m
                         content={content}[m
                         title={title}[m
                         picture={picture}[m
[31m-                        sourceThumbnail={setPicture}[m
[31m-                        sourceData={setContent}[m
[31m-                        sourceTitle={setTitle}[m
[32m+[m[32m                        description={description}[m
[32m+[m[32m                        sourceDescription={sourceDescription}[m
[32m+[m[32m                        sourceThumbnail={sourceThumbnail}[m
[32m+[m[32m                        sourceData={sourceData}[m
[32m+[m[32m                        sourceTitle={sourceTitle}[m
                     />[m
                     <div className="flex justify-center  items-center mt-4">[m
                         <Button[m
[1mdiff --git a/src/app/(admin)/layout.tsx b/src/app/(admin)/layout.tsx[m
[1mindex fdf4ef1..3797f99 100644[m
[1m--- a/src/app/(admin)/layout.tsx[m
[1m+++ b/src/app/(admin)/layout.tsx[m
[36m@@ -16,13 +16,11 @@[m [mexport default function RootLayout({[m
   children: React.ReactNode;[m
 }>) {[m
   return ([m
[31m-    <html lang="pt-BR">[m
[31m-      <body>[m
[32m+[m[32m      <>[m
       <Header/>[m
         <div className="relative w-full  z-100">[m
           {children}[m
         </div>[m
[31m-      </body>[m
[31m-    </html>[m
[32m+[m[32m      </>[m
   );[m
 }[m
[1mdiff --git a/src/app/beachsoccer/layout.tsx b/src/app/beachsoccer/layout.tsx[m
[1mindex 8e3aaa2..76df0ef 100644[m
[1m--- a/src/app/beachsoccer/layout.tsx[m
[1m+++ b/src/app/beachsoccer/layout.tsx[m
[36m@@ -16,13 +16,11 @@[m [mexport default function RootLayout({[m
   children: React.ReactNode;[m
 }>) {[m
   return ([m
[31m-    <html lang="pt-BR">[m
[31m-      <body>[m
[32m+[m[32m      <>[m
       <Header/>[m
         <div className="relative w-full  z-100">[m
           {children}[m
         </div>[m
[31m-      </body>[m
[31m-    </html>[m
[32m+[m[32m      </>[m
   );[m
 }[m
[1mdiff --git a/src/app/futevolei/layout.tsx b/src/app/futevolei/layout.tsx[m
[1mindex 8e3aaa2..77635a4 100644[m
[1m--- a/src/app/futevolei/layout.tsx[m
[1m+++ b/src/app/futevolei/layout.tsx[m
[36m@@ -1,6 +1,5 @@[m
 import type { Metadata } from "next";[m
 import "@/app/globals.css";[m
[31m-import Image from "next/image";[m
 import Header from "@/app/components/header/header";[m
 [m
 [m
[36m@@ -16,13 +15,11 @@[m [mexport default function RootLayout({[m
   children: React.ReactNode;[m
 }>) {[m
   return ([m
[31m-    <html lang="pt-BR">[m
[31m-      <body>[m
[31m-      <Header/>[m
[31m-        <div className="relative w-full  z-100">[m
[31m-          {children}[m
[31m-        </div>[m
[31m-      </body>[m
[31m-    </html>[m
[32m+[m[32m      <>[m
[32m+[m[32m        <Header/>[m
[32m+[m[32m          <div className="relative w-full  z-100">[m
[32m+[m[32m            {children}[m
[32m+[m[32m          </div>[m
[32m+[m[32m      </>[m
   );[m
 }[m
[1mdiff --git a/src/app/volei/layout.tsx b/src/app/volei/layout.tsx[m
[1mindex 8e3aaa2..10f8ec9 100644[m
[1m--- a/src/app/volei/layout.tsx[m
[1m+++ b/src/app/volei/layout.tsx[m
[36m@@ -16,13 +16,12 @@[m [mexport default function RootLayout({[m
   children: React.ReactNode;[m
 }>) {[m
   return ([m
[31m-    <html lang="pt-BR">[m
[31m-      <body>[m
[32m+[m
[32m+[m[32m      <>[m
       <Header/>[m
         <div className="relative w-full  z-100">[m
           {children}[m
         </div>[m
[31m-      </body>[m
[31m-    </html>[m
[32m+[m[32m      </>[m
   );[m
 }[m

[33mcommit 963b49fbdbd85b9d65a983ff2b0bdbcaf8d6f252[m
Author: Mateus Luiz <111666787+Mktvbr@users.noreply.github.com>
Date:   Thu Aug 7 14:47:35 2025 -0300

    Update README.md

[1mdiff --git a/README.md b/README.md[m
[1mindex c78934e..5f17fdf 100644[m
[1m--- a/README.md[m
[1m+++ b/README.md[m
[36m@@ -9,6 +9,7 @@[m [mProjeto desenvolvido com **Next.js**, **Tailwind CSS** e **Prisma** para exibir[m
 - Prisma + SQLite/PostgreSQL[m
 - QuillJS Editor[m
 - TypeScript[m
[32m+[m[32m- Axios[m
 [m
 📦 Instalação[m
 [m

[33mcommit 3b893d9c4ba5310095490f0415638d17c85a6d75[m
Author: Mktvbr <mateusluizsr@hotmail.com>
Date:   Thu Aug 7 14:46:29 2025 -0300

    correção no admin/beachsoccer, foi substituído fetch por axios e correção de bugs

[1mdiff --git a/src/app/(admin)/admin/beachsoccer/beachsoccerclient.tsx b/src/app/(admin)/admin/beachsoccer/beachsoccerclient.tsx[m
[1mindex 4116cad..82ff645 100644[m
[1m--- a/src/app/(admin)/admin/beachsoccer/beachsoccerclient.tsx[m
[1m+++ b/src/app/(admin)/admin/beachsoccer/beachsoccerclient.tsx[m
[36m@@ -5,6 +5,7 @@[m [mimport { useState } from "react";[m
 import { Button } from 'primereact/button';[m
 import { beachsoccerService } from "@/services";[m
 import { useSession } from "next-auth/react";[m
[32m+[m[32mimport Description from "@/app/components/description";[m
 [m
 [m
 export default function BeachsoccerClient() {[m
[36m@@ -13,22 +14,27 @@[m [mexport default function BeachsoccerClient() {[m
     // "data" é renomeado para "session" para facilitar o uso[m
     const { data: session } = useSession() [m
 [m
[31m-    const [content, setContent] = useState('')[m
[31m-    const [title, setTitle] = useState('')[m
[31m-    const [picture, setPicture] = useState('')[m
[32m+[m[32m    const [content, setContent] = useState('');[m
[32m+[m[32m    const [title, setTitle] = useState('');[m
[32m+[m[32m    const [picture, setPicture] = useState('');[m
[32m+[m[32m    const [description, setDescription] = useState('');[m
 [m
     // Função usada para receber o conteúdo do editor e atualizar o estado 'content'[m
     const sourceData = (data: any) => {[m
[31m-        setContent(data)[m
[32m+[m[32m        setContent(data);[m
     }[m
 [m
     // Função usada para receber o título e atualizar o estado 'title'[m
     const sourceTitle = (title: any) => {[m
[31m-        setTitle(title)[m
[32m+[m[32m        setTitle(title);[m
     }[m
 [m
     const sourceThumbnail = (thumbnail: any) => {[m
[31m-        setPicture(thumbnail)[m
[32m+[m[32m        setPicture(thumbnail);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const sourceDescription = (description: any) => {[m
[32m+[m[32m        setDescription(description);[m
     }[m
 [m
     // Função assíncrona que será chamada ao clicar no botão 'Salvar'[m
[36m@@ -38,7 +44,8 @@[m [mexport default function BeachsoccerClient() {[m
         const body = {[m
             title: title,[m
             content: content,[m
[31m-            picture: picture,[m
[32m+[m[32m            picture: picture,[m[41m [m
[32m+[m[32m            description: description,[m
             published: false,[m
             authorId: session?.user.id[m
         }[m
[36m@@ -67,6 +74,8 @@[m [mexport default function BeachsoccerClient() {[m
                         content={content}[m
                         title={title}[m
                         picture={picture}[m
[32m+[m[32m                        description={description}[m
[32m+[m[32m                        sourceDescription={sourceDescription}[m
                         sourceThumbnail={sourceThumbnail}[m
                         sourceData={setContent}[m
                         sourceTitle={setTitle}[m
[1mdiff --git a/src/app/components/editor/editor.tsx b/src/app/components/editor/editor.tsx[m
[1mindex bcc35a6..857811e 100644[m
[1m--- a/src/app/components/editor/editor.tsx[m
[1m+++ b/src/app/components/editor/editor.tsx[m
[36m@@ -4,6 +4,7 @@[m [mimport { Editor } from "primereact/editor";[m
 import { InputText } from 'primereact/inputtext';[m
 import Thumbnails from "../thumbnails/thumbnails";[m
 import Description from "../description/index"[m
[32m+[m[32mimport axios, {AxiosResponse} from "axios";[m
 import './styles/quillFix.css';[m
 [m
 // Define a interface para os props que o componente EditorBloco irá receber[m
[36m@@ -25,13 +26,12 @@[m [mexport default function EditorBloco({ sourceData,sourceDescription, sourceTitle,[m
 [m
     //função que envia o conteúdo para a api[m
     const handleSave = async () => {[m
[31m-        const res = await fetch('/api/salvarTexto', {[m
[31m-            method: 'POST',[m
[32m+[m[32m        const res = await axios.post('/api/salvarTexto', {[m
             headers: { 'Content-Type': 'application/json' },[m
[31m-            body: JSON.stringify({ [m
[32m+[m[32m            data: {[m[41m [m
                 content: content,[m
                 description: description,[m
[31m-            })[m
[32m+[m[32m            }[m
             [m
         });[m
     }[m

[33mcommit 4cc48eca2c9bf99e8bc0a91858d0236b181d869e[m
Author: Mktvbr <mateusluizsr@hotmail.com>
Date:   Thu Aug 7 14:05:53 2025 -0300

    Melhoria nos serviços de API: inclusão de tipagem e mensagens de erro

[1mdiff --git a/src/services/index.ts b/src/services/index.ts[m
[1mindex ed24c85..4513888 100644[m
[1m--- a/src/services/index.ts[m
[1m+++ b/src/services/index.ts[m
[36m@@ -1,8 +1,8 @@[m
[31m-const axios = require('axios');[m
[32m+[m[32mimport axios, { AxiosResponse } from 'axios';[m
 [m
[31m-export const voleiService = async (body:any) => {[m
[32m+[m[32mexport const voleiService = async (body:any):Promise<AxiosResponse> => {[m
     try {[m
[31m-        const response = await axios.post('/api/volei',body,{[m
[32m+[m[32m        const response =  await axios.post('/api/volei',body,{[m
             headers: { 'Content-Type': 'application/json' }[m
         })[m
 [m
[36m@@ -15,7 +15,7 @@[m [mexport const voleiService = async (body:any) => {[m
 [m
 }[m
 [m
[31m-export const futevoleiService = async (body:any) => {[m
[32m+[m[32mexport const futevoleiService = async (body:any):Promise<AxiosResponse> => {[m
     try {[m
         const response = await axios.post('/api/futevolei',body,{[m
             headers: { 'Content-Type': 'application/json' }[m
[36m@@ -27,12 +27,12 @@[m [mexport const futevoleiService = async (body:any) => {[m
 [m
     }catch (error) {[m
         console.error('Erro no serviço de futevôlei:', error);[m
[31m-        throw new Error('Erro ao processar a solicitação de vôlei');[m
[32m+[m[32m        throw new Error('Erro ao processar a solicitação de futevôlei');[m
     }[m
 [m
 }[m
 [m
[31m-export const beachsoccerService = async (body:any) => {[m
[32m+[m[32mexport const beachsoccerService = async (body:any):Promise<AxiosResponse> => {[m
     try {[m
         const response = await axios.post('/api/beachsoccer',body,{[m
             headers: { 'Content-Type': 'application/json' }[m

[33mcommit 4d918b12991bcda3e4271a16f723cca30657be2a[m
Author: Mktvbr <mateusluizsr@hotmail.com>
Date:   Wed Aug 6 15:43:44 2025 -0300

    substituição do fetch por axio no services

[1mdiff --git a/package-lock.json b/package-lock.json[m
[1mindex dda51b2..17e0389 100644[m
[1m--- a/package-lock.json[m
[1m+++ b/package-lock.json[m
[36m@@ -10,6 +10,7 @@[m
       "dependencies": {[m
         "@auth/prisma-adapter": "^2.9.1",[m
         "@prisma/client": "^6.8.2",[m
[32m+[m[32m        "axios": "^1.11.0",[m
         "cheerio": "^1.1.0",[m
         "coloring-console": "^1.0.22",[m
         "next": "15.3.1",[m
[36m@@ -1530,6 +1531,11 @@[m
         "@types/react": "*"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/asynckit": {[m
[32m+[m[32m      "version": "0.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Oei9OH4tRh0YqU3GxhX79dM/mwVgvbZJaSNaRk+bshkj0S5cfHcgYakreBjrHwatXKbz+IoIdYLxrKim2MjW0Q=="[m
[32m+[m[32m    },[m
     "node_modules/autoprefixer": {[m
       "version": "10.4.21",[m
       "resolved": "https://registry.npmjs.org/autoprefixer/-/autoprefixer-10.4.21.tgz",[m
[36m@@ -1567,6 +1573,16 @@[m
         "postcss": "^8.1.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/axios": {[m
[32m+[m[32m      "version": "1.11.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/axios/-/axios-1.11.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-1Lx3WLFQWm3ooKDYZD1eXmoGO9fxYQjrycfHFC8P0sCfQVXyROp0p9PFWBehewBOdCwHc+f/b8I0fMto5eSfwA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "follow-redirects": "^1.15.6",[m
[32m+[m[32m        "form-data": "^4.0.4",[m
[32m+[m[32m        "proxy-from-env": "^1.1.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/boolbase": {[m
       "version": "1.0.0",[m
       "resolved": "https://registry.npmjs.org/boolbase/-/boolbase-1.0.0.tgz",[m
[36m@@ -1615,6 +1631,18 @@[m
         "node": ">=10.16.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/call-bind-apply-helpers": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-Sp1ablJ0ivDkSzjcaJdxEunN5/XvksFJ2sMBFfq6x0ryhQV/2b/KwFe21cMpmHtPOSij8K99/wSfoEuTObmuMQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "function-bind": "^1.1.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/caniuse-lite": {[m
       "version": "1.0.30001718",[m
       "resolved": "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001718.tgz",[m
[36m@@ -1734,6 +1762,17 @@[m
       "resolved": "https://registry.npmjs.org/coloring-console/-/coloring-console-1.0.22.tgz",[m
       "integrity": "sha512-WxT60qUgS5ft8sHndTzpiEdQ2cRST4O3LuxWYBzy/aO/h6Aany0fsu+YZTMnKE1RfWaOf6wucUUfyp5WKHD89g=="[m
     },[m
[32m+[m[32m    "node_modules/combined-stream": {[m
[32m+[m[32m      "version": "1.0.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "delayed-stream": "~1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/cookie": {[m
       "version": "0.6.0",[m
       "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.6.0.tgz",[m
[36m@@ -1792,6 +1831,14 @@[m
         }[m
       }[m
     },[m
[32m+[m[32m    "node_modules/delayed-stream": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZySD7Nf91aLB0RxL4KGrKHBXl7Eds1DAmEdcoVawXnLD7SDhpNgtuII2aAkg7a7QS41jxPSZ17p4VdGnMHk3MQ==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/detect-libc": {[m
       "version": "2.0.4",[m
       "resolved": "https://registry.npmjs.org/detect-libc/-/detect-libc-2.0.4.tgz",[m
[36m@@ -1861,6 +1908,19 @@[m
         "url": "https://github.com/fb55/domutils?sponsor=1"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/dunder-proto": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/dunder-proto/-/dunder-proto-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-KIN/nDJBQRcXw0MLVhZE9iQHmG68qAVIBg9CqmUYjmQIhgij9U5MFvrqkUL5FbtyyzZuOeOt0zdeRe4UY7ct+A==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind-apply-helpers": "^1.0.1",[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "gopd": "^1.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/electron-to-chromium": {[m
       "version": "1.5.155",[m
       "resolved": "https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.5.155.tgz",[m
[36m@@ -1903,6 +1963,47 @@[m
         "url": "https://github.com/fb55/entities?sponsor=1"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/es-define-property": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-define-property/-/es-define-property-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-e3nRfgfUZ4rNGL232gUgX06QNyyez04KdjFrF+LTRoOXmrOgFKDg4BCdsjW8EnT69eqdYGmRpJwiPVYNrCaW3g==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-errors": {[m
[32m+[m[32m      "version": "1.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-errors/-/es-errors-1.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Zf5H2Kxt2xjTvbJvP2ZWLEICxA6j+hAmMzIlypy4xcBg1vKVnx89Wy0GbS+kf5cwCVFFzdCFh2XSCFNULS6csw==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-object-atoms": {[m
[32m+[m[32m      "version": "1.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-object-atoms/-/es-object-atoms-1.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-FGgH2h8zKNim9ljj7dankFPcICIK9Cp5bm+c2gQSYePhpaG5+esrLODihIorn+Pe6FGJzWhXQotPv73jTaldXA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "es-errors": "^1.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-set-tostringtag": {[m
[32m+[m[32m      "version": "2.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-set-tostringtag/-/es-set-tostringtag-2.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-j6vWzfrGVfyXxge+O0x5sh6cvxAog0a/4Rdd2K36zCMV5eJ+/+tOAngRO8cODMNWbVRdVlmGZQL2YS3yR8bIUA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "get-intrinsic": "^1.2.6",[m
[32m+[m[32m        "has-tostringtag": "^1.0.2",[m
[32m+[m[32m        "hasown": "^2.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/esbuild": {[m
       "version": "0.25.4",[m
       "resolved": "https://registry.npmjs.org/esbuild/-/esbuild-0.25.4.tgz",[m
[36m@@ -1974,6 +2075,40 @@[m
       "resolved": "https://registry.npmjs.org/fast-diff/-/fast-diff-1.3.0.tgz",[m
       "integrity": "sha512-VxPP4NqbUjj6MaAOafWeUn2cXWLcCtljklUtZf0Ind4XQ+QPtmA0b18zZy0jIQx+ExRVCR/ZQpBmik5lXshNsw=="[m
     },[m
[32m+[m[32m    "node_modules/follow-redirects": {[m
[32m+[m[32m      "version": "1.15.11",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/follow-redirects/-/follow-redirects-1.15.11.tgz",[m
[32m+[m[32m      "integrity": "sha512-deG2P0JfjrTxl50XGCDyfI97ZGVCxIpfKYmfyrQ54n5FO/0gfIES8C/Psl6kWVDolizcaaxZJnTS0QSMxvnsBQ==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "individual",[m
[32m+[m[32m          "url": "https://github.com/sponsors/RubenVerborgh"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "debug": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/form-data": {[m
[32m+[m[32m      "version": "4.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/form-data/-/form-data-4.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-KrGhL9Q4zjj0kiUt5OO4Mr/A/jlI2jDYs5eHBpYHPcBEVSiipAvn2Ko2HnPe20rmcuuvMHNdZFp+4IlGTMF0Ow==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "asynckit": "^0.4.0",[m
[32m+[m[32m        "combined-stream": "^1.0.8",[m
[32m+[m[32m        "es-set-tostringtag": "^2.1.0",[m
[32m+[m[32m        "hasown": "^2.0.2",[m
[32m+[m[32m        "mime-types": "^2.1.12"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/fraction.js": {[m
       "version": "4.3.7",[m
       "resolved": "https://registry.npmjs.org/fraction.js/-/fraction.js-4.3.7.tgz",[m
[36m@@ -2001,12 +2136,102 @@[m
         "node": "^8.16.0 || ^10.6.0 || >=11.0.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/function-bind": {[m
[32m+[m[32m      "version": "1.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/function-bind/-/function-bind-1.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-7XHNxH7qX9xG5mIwxkhumTox/MIRNcOgDrxWsMt2pAr23WHp6MrRlN7FBSFpCpr+oVO0F744iUgR82nJMfG2SA==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/get-intrinsic": {[m
[32m+[m[32m      "version": "1.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-9fSjSaos/fRIVIp+xSJlE6lfwhES7LNtKaCBIamHsjr2na1BiABJPo0mOjjz8GJDURarmCPGqaiVg5mfjb98CQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind-apply-helpers": "^1.0.2",[m
[32m+[m[32m        "es-define-property": "^1.0.1",[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "es-object-atoms": "^1.1.1",[m
[32m+[m[32m        "function-bind": "^1.1.2",[m
[32m+[m[32m        "get-proto": "^1.0.1",[m
[32m+[m[32m        "gopd": "^1.2.0",[m
[32m+[m[32m        "has-symbols": "^1.1.0",[m
[32m+[m[32m        "hasown": "^2.0.2",[m
[32m+[m[32m        "math-intrinsics": "^1.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/get-proto": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/get-proto/-/get-proto-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-sTSfBjoXBp89JvIKIefqw7U2CCebsc74kiY6awiGogKtoSGbgjYE/G/+l9sF3MWFPNc9IcoOC4ODfKHfxFmp0g==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "dunder-proto": "^1.0.1",[m
[32m+[m[32m        "es-object-atoms": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/gopd": {[m
[32m+[m[32m      "version": "1.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/gopd/-/gopd-1.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZUKRh6/kUFoAiTAtTYPZJ3hw9wNxx+BIBOijnlG9PnrJsCcSjs1wyyD6vJpaYtgnzDrKYRSqf3OO6Rfa93xsRg==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/graceful-fs": {[m
       "version": "4.2.11",[m
       "resolved": "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz",[m
       "integrity": "sha512-RbJ5/jmFcNNCcDV5o9eTnBLJ/HszWV0P73bc+Ff4nS/rJj+YaS6IGyiOL0VoBYX+l1Wrl3k63h/KrH+nhJ0XvQ==",[m
       "dev": true[m
     },[m
[32m+[m[32m    "node_modules/has-symbols": {[m
[32m+[m[32m      "version": "1.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-symbols/-/has-symbols-1.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-1cDNdwJ2Jaohmb3sg4OmKaMBwuC48sYni5HUw2DvsC8LjGTLK9h+eb1X6RyuOHe4hT0ULCW68iomhjUoKUqlPQ==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-tostringtag": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-NqADB8VjPFLM2V0VvHUewwwsw0ZWBaIdgo+ieHtK3hasLz4qeCRjYcqfB6AQrBggRKppKF8L52/VqdVsO47Dlw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "has-symbols": "^1.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/hasown": {[m
[32m+[m[32m      "version": "2.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/hasown/-/hasown-2.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-0hJU9SCPvmMzIBdZFqNPXWa6dqh7WdH0cII9y+CyS8rG3nL48Bclra9HmKhVVUHyPWNH5Y7xDwAB7bfgSjkUMQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "function-bind": "^1.1.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/htmlparser2": {[m
       "version": "10.0.0",[m
       "resolved": "https://registry.npmjs.org/htmlparser2/-/htmlparser2-10.0.0.tgz",[m
[36m@@ -2352,6 +2577,33 @@[m
         "@jridgewell/sourcemap-codec": "^1.5.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/math-intrinsics": {[m
[32m+[m[32m      "version": "1.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/math-intrinsics/-/math-intrinsics-1.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-/IXtbwEk5HTPyEwyKX6hGkYXxM9nbj64B+ilVJnC/R6B0pH5G4V3b0pVbL7DBj4tkhBAppbQUlf6F6Xl9LHu1g==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/mime-db": {[m
[32m+[m[32m      "version": "1.52.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-sPU4uV7dYlvtWJxwwxHD0PuihVNiE7TyAbQ5SWxDCB9mUYvOgroQOwYQQOKPJ8CIbE+1ETVlOoK1UC2nU3gYvg==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/mime-types": {[m
[32m+[m[32m      "version": "2.1.35",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZDY+bPm5zTTF+YpCrAU9nK0UgICYPT0QtT1NZWFv4s++TNkcgVaT0g6+4R2uI4MjQjzysHB1zxuWL50hzaeXiw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "mime-db": "1.52.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/minipass": {[m
       "version": "7.1.2",[m
       "resolved": "https://registry.npmjs.org/minipass/-/minipass-7.1.2.tgz",[m
[36m@@ -2799,6 +3051,11 @@[m
         "react-is": "^16.13.1"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/proxy-from-env": {[m
[32m+[m[32m      "version": "1.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/proxy-from-env/-/proxy-from-env-1.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-D+zkORCbA9f1tdWRK0RaCR3GPv50cMxcrz4X8k5LTSUD1Dkw47mKJEZQNunItRTkWwgtaUSo1RVFRIG9ZXiFYg=="[m
[32m+[m[32m    },[m
     "node_modules/quill": {[m
       "version": "2.0.3",[m
       "resolved": "https://registry.npmjs.org/quill/-/quill-2.0.3.tgz",[m
[1mdiff --git a/package.json b/package.json[m
[1mindex 061c21a..bdbc42b 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -11,6 +11,7 @@[m
   "dependencies": {[m
     "@auth/prisma-adapter": "^2.9.1",[m
     "@prisma/client": "^6.8.2",[m
[32m+[m[32m    "axios": "^1.11.0",[m
     "cheerio": "^1.1.0",[m
     "coloring-console": "^1.0.22",[m
     "next": "15.3.1",[m
[1mdiff --git a/src/app/volei/page.tsx b/src/app/volei/page.tsx[m
[1mindex e7f2a3a..8a17def 100644[m
[1m--- a/src/app/volei/page.tsx[m
[1m+++ b/src/app/volei/page.tsx[m
[36m@@ -1,9 +1,9 @@[m
 import prisma from '@/lib/prisma';[m
 import Link from 'next/link';[m
[31m-import Image from 'next/image';[m
 [m
 [m
[31m-export default async function FutevoleiFeed() {[m
[32m+[m
[32m+[m[32mexport default async function voleiFeed() {[m
 [m
     const posts = await prisma.postVolei.findMany({[m
         orderBy: { createdAt: 'desc' },[m
[36m@@ -15,7 +15,7 @@[m [mexport default async function FutevoleiFeed() {[m
     return ([m
         <main className="flex w-full h-auto justify-center overflow-y-auto overflow-x-auto break-words">[m
             <div className="flex flex-col w-full h-full max-w-4xl items-center bg-orange-300 shadow-xl p-5 z-10">[m
[31m-                <h1 className="text-2xl font-bold mb-4">Futevôlei</h1>[m
[32m+[m[32m                <h1 className="text-2xl font-bold mb-4">Vôlei</h1>[m
                 {posts.length === 0 ? ([m
                     <p className="text-lg mb-6">Nenhum post encontrado.</p>[m
                 ) : ([m
[36m@@ -47,8 +47,6 @@[m [mexport default async function FutevoleiFeed() {[m
                         </Link>[m
                     ))[m
                 )}[m
[31m-[m
[31m-                {/* <img src="/images/futevolei.jpg" alt="Futevôlei" className="w-full h-auto rounded-lg shadow-md" /> */}[m
             </div>[m
         </main>[m
     );[m
[1mdiff --git a/src/services/index.ts b/src/services/index.ts[m
[1mindex 807fc30..ed24c85 100644[m
[1m--- a/src/services/index.ts[m
[1m+++ b/src/services/index.ts[m
[36m@@ -1,11 +1,9 @@[m
[32m+[m[32mconst axios = require('axios');[m
[32m+[m
 export const voleiService = async (body:any) => {[m
     try {[m
[31m-        const response = await fetch('/api/volei',{[m
[31m-            method: 'POST',[m
[31m-            headers: { 'Content-Type': 'application/json' },[m
[31m-            body: JSON.stringify([m
[31m-                body[m
[31m-            ),[m
[32m+[m[32m        const response = await axios.post('/api/volei',body,{[m
[32m+[m[32m            headers: { 'Content-Type': 'application/json' }[m
         })[m
 [m
         return response;[m
[36m@@ -19,12 +17,8 @@[m [mexport const voleiService = async (body:any) => {[m
 [m
 export const futevoleiService = async (body:any) => {[m
     try {[m
[31m-        const response = await fetch('/api/futevolei',{[m
[31m-            method: 'POST',[m
[31m-            headers: { 'Content-Type': 'application/json' },[m
[31m-            body: JSON.stringify([m
[31m-                body[m
[31m-            ),[m
[32m+[m[32m        const response = await axios.post('/api/futevolei',body,{[m
[32m+[m[32m            headers: { 'Content-Type': 'application/json' }[m
         })[m
 [m
 [m
[36m@@ -40,12 +34,8 @@[m [mexport const futevoleiService = async (body:any) => {[m
 [m
 export const beachsoccerService = async (body:any) => {[m
     try {[m
[31m-        const response = await fetch('/api/beachsoccer',{[m
[31m-            method: 'POST',[m
[31m-            headers: { 'Content-Type': 'application/json' },[m
[31m-            body: JSON.stringify([m
[31m-                body[m
[31m-            ),[m
[32m+[m[32m        const response = await axios.post('/api/beachsoccer',body,{[m
[32m+[m[32m            headers: { 'Content-Type': 'application/json' }[m
         })[m
 [m
         return response;[m

[33mcommit a2e1e46842c146a6064967edf7bdca826ae782f7[m
Author: Mateus Luiz <111666787+Mktvbr@users.noreply.github.com>
Date:   Mon Aug 4 22:28:55 2025 -0300

    Create README.md

[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..c78934e[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1,26 @@[m
[32m+[m[32mBeachScore 🏖️[m
[32m+[m
[32m+[m[32mProjeto desenvolvido com **Next.js**, **Tailwind CSS** e **Prisma** para exibir pontuações e postagens sobre esportes de praia, como vôlei, futevôlei e beach soccer.[m
[32m+[m
[32m+[m[32m🚀 Tecnologias[m
[32m+[m
[32m+[m[32m- Next.js (App Router)[m
[32m+[m[32m- Tailwind CSS[m
[32m+[m[32m- Prisma + SQLite/PostgreSQL[m
[32m+[m[32m- QuillJS Editor[m
[32m+[m[32m- TypeScript[m
[32m+[m
[32m+[m[32m📦 Instalação[m
[32m+[m
[32m+[m[32m1. Clone o repositório:[m
[32m+[m
[32m+[m[32mgit clone https://github.com/Mktvbr/beachscore.git[m
[32m+[m[32mcd beachscoreS[m
[32m+[m
[32m+[m
[32m+[m[32m✨ Funcionalidades[m
[32m+[m
[32m+[m[32m- Seleção do esporte preferido ao acessar[m
[32m+[m[32m- Criação de postagens com editor Quill[m
[32m+[m[32m- Renderização de conteúdo formatado[m
[32m+[m[32m- Interface responsiva e otimizada[m

[33mcommit d33f5dba6e148819a124321a679e16bc4f98e92c[m
Author: Mktvbr <mateusluizsr@hotmail.com>
Date:   Mon Aug 4 22:05:59 2025 -0300

    WIP: mudanças locais antes do pull

[1mdiff --git a/.gitignore b/.gitignore[m
[1mindex 5ef6a52..e1c3af4 100644[m
[1m--- a/.gitignore[m
[1m+++ b/.gitignore[m
[36m@@ -1,5 +1,6 @@[m
 # See https://help.github.com/articles/ignoring-files/ for more about ignoring files.[m
 [m
[32m+[m[32m.env[m
 # dependencies[m
 /node_modules[m
 /.pnp[m
[1mdiff --git a/README.md b/README.md[m
[1mdeleted file mode 100644[m
[1mindex c78934e..0000000[m
[1m--- a/README.md[m
[1m+++ /dev/null[m
[36m@@ -1,26 +0,0 @@[m
[31m-BeachScore 🏖️[m
[31m-[m
[31m-Projeto desenvolvido com **Next.js**, **Tailwind CSS** e **Prisma** para exibir pontuações e postagens sobre esportes de praia, como vôlei, futevôlei e beach soccer.[m
[31m-[m
[31m-🚀 Tecnologias[m
[31m-[m
[31m-- Next.js (App Router)[m
[31m-- Tailwind CSS[m
[31m-- Prisma + SQLite/PostgreSQL[m
[31m-- QuillJS Editor[m
[31m-- TypeScript[m
[31m-[m
[31m-📦 Instalação[m
[31m-[m
[31m-1. Clone o repositório:[m
[31m-[m
[31m-git clone https://github.com/Mktvbr/beachscore.git[m
[31m-cd beachscoreS[m
[31m-[m
[31m-[m
[31m-✨ Funcionalidades[m
[31m-[m
[31m-- Seleção do esporte preferido ao acessar[m
[31m-- Criação de postagens com editor Quill[m
[31m-- Renderização de conteúdo formatado[m
[31m-- Interface responsiva e otimizada[m
[1mdiff --git a/next.config.ts b/next.config.ts[m
[1mindex e9ffa30..224b0ba 100644[m
[1m--- a/next.config.ts[m
[1m+++ b/next.config.ts[m
[36m@@ -4,4 +4,5 @@[m [mconst nextConfig: NextConfig = {[m
   /* config options here */[m
 };[m
 [m
[32m+[m
 export default nextConfig;[m
[1mdiff --git a/package-lock.json b/package-lock.json[m
[1mindex 97bfd16..dda51b2 100644[m
[1m--- a/package-lock.json[m
[1m+++ b/package-lock.json[m
[36m@@ -8,15 +8,25 @@[m
       "name": "beachscore",[m
       "version": "0.1.0",[m
       "dependencies": {[m
[32m+[m[32m        "@auth/prisma-adapter": "^2.9.1",[m
[32m+[m[32m        "@prisma/client": "^6.8.2",[m
[32m+[m[32m        "cheerio": "^1.1.0",[m
[32m+[m[32m        "coloring-console": "^1.0.22",[m
         "next": "15.3.1",[m
[32m+[m[32m        "next-auth": "^4.24.11",[m
[32m+[m[32m        "primereact": "^10.9.5",[m
[32m+[m[32m        "quill": "^2.0.3",[m
         "react": "^19.0.0",[m
         "react-dom": "^19.0.0"[m
       },[m
       "devDependencies": {[m
[31m-        "@tailwindcss/postcss": "^4",[m
[32m+[m[32m        "@tailwindcss/postcss": "^4.1.7",[m
[32m+[m[32m        "@types/next-auth": "^3.15.0",[m
         "@types/node": "^20",[m
         "@types/react": "^19",[m
         "@types/react-dom": "^19",[m
[32m+[m[32m        "autoprefixer": "^10.4.21",[m
[32m+[m[32m        "prisma": "^6.7.0",[m
         "tailwindcss": "^4",[m
         "typescript": "^5"[m
       }[m
[36m@@ -33,6 +43,133 @@[m
         "url": "https://github.com/sponsors/sindresorhus"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/@ampproject/remapping": {[m
[32m+[m[32m      "version": "2.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@ampproject/remapping/-/remapping-2.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-30iZtAPgz+LTIYoeivqYo853f02jBYSd5uGnGpkFV0M3xOt9aN73erkgYAmZU43x4VfqcnLxW9Kpg3R5LC4YYw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/gen-mapping": "^0.3.5",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.24"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@auth/core": {[m
[32m+[m[32m      "version": "0.34.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@auth/core/-/core-0.34.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-KywHKRgLiF3l7PLyL73fjLSIBe1YNcA6sMeew4yMP6cfCWGXZrkkXd32AjRi1hlJ9nvovUBGZHvbn+LijO6ZeQ==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@panva/hkdf": "^1.1.1",[m
[32m+[m[32m        "@types/cookie": "0.6.0",[m
[32m+[m[32m        "cookie": "0.6.0",[m
[32m+[m[32m        "jose": "^5.1.3",[m
[32m+[m[32m        "oauth4webapi": "^2.10.4",[m
[32m+[m[32m        "preact": "10.11.3",[m
[32m+[m[32m        "preact-render-to-string": "5.2.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@simplewebauthn/browser": "^9.0.1",[m
[32m+[m[32m        "@simplewebauthn/server": "^9.0.2",[m
[32m+[m[32m        "nodemailer": "^6.8.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "@simplewebauthn/browser": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "@simplewebauthn/server": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "nodemailer": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@auth/core/node_modules/preact": {[m
[32m+[m[32m      "version": "10.11.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/preact/-/preact-10.11.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-eY93IVpod/zG3uMF22Unl8h9KkrcKIRs2EGar8hwLZZDU1lkjph303V9HZBwufh2s736U6VXuhD109LYqPoffg==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/preact"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@auth/prisma-adapter": {[m
[32m+[m[32m      "version": "2.9.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@auth/prisma-adapter/-/prisma-adapter-2.9.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-0ZfjOPt3Ci8yx8SMCydAuBAjR/exI/8SAr6JDVYtqDFhm0JaV1XuHYgEzgzXZZfW2+WKC29LowCWxdCjoAz9kQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@auth/core": "0.39.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@prisma/client": ">=2.26.0 || >=3 || >=4 || >=5 || >=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@auth/prisma-adapter/node_modules/@auth/core": {[m
[32m+[m[32m      "version": "0.39.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@auth/core/-/core-0.39.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-McD8slui0oOA1pjR5sPjLPl5Zm//nLP/8T3kr8hxIsvNLvsiudYvPHhDFPjh1KcZ2nFxCkZmP6bRxaaPd/AnLA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@panva/hkdf": "^1.2.1",[m
[32m+[m[32m        "jose": "^6.0.6",[m
[32m+[m[32m        "oauth4webapi": "^3.3.0",[m
[32m+[m[32m        "preact": "10.24.3",[m
[32m+[m[32m        "preact-render-to-string": "6.5.11"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@simplewebauthn/browser": "^9.0.1",[m
[32m+[m[32m        "@simplewebauthn/server": "^9.0.2",[m
[32m+[m[32m        "nodemailer": "^6.8.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "@simplewebauthn/browser": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "@simplewebauthn/server": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "nodemailer": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@auth/prisma-adapter/node_modules/jose": {[m
[32m+[m[32m      "version": "6.0.11",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/jose/-/jose-6.0.11.tgz",[m
[32m+[m[32m      "integrity": "sha512-QxG7EaliDARm1O1S8BGakqncGT9s25bKL1WSf6/oa17Tkqwi8D2ZNglqCF+DsYF88/rV66Q/Q2mFAy697E1DUg==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@auth/prisma-adapter/node_modules/oauth4webapi": {[m
[32m+[m[32m      "version": "3.5.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/oauth4webapi/-/oauth4webapi-3.5.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-txg/jZQwcbaF7PMJgY7aoxc9QuCxHVFMiEkDIJ60DwDz3PbtXPQnrzo+3X4IRYGChIwWLabRBRpf1k9hO9+xrQ==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@auth/prisma-adapter/node_modules/preact-render-to-string": {[m
[32m+[m[32m      "version": "6.5.11",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/preact-render-to-string/-/preact-render-to-string-6.5.11.tgz",[m
[32m+[m[32m      "integrity": "sha512-ubnauqoGczeGISiOh6RjX0/cdaF8v/oDXIjO85XALCQjwQP+SB4RDXXtvZ6yTYSjG+PC1QRP2AhPgCEsM2EvUw==",[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "preact": ">=10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@babel/runtime": {[m
[32m+[m[32m      "version": "7.27.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@babel/runtime/-/runtime-7.27.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-1x3D2xEk2fRo3PAhwQwu5UubzgiVWSXTBfWpVd2Mx2AzRqJuDJCsgaDVZ7HB5iGzDW1Hl1sWN2mFyKjmR9uAog==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.9.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/@emnapi/runtime": {[m
       "version": "1.4.3",[m
       "resolved": "https://registry.npmjs.org/@emnapi/runtime/-/runtime-1.4.3.tgz",[m
[36m@@ -42,6 +179,406 @@[m
         "tslib": "^2.4.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/@esbuild/aix-ppc64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/aix-ppc64/-/aix-ppc64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-1VCICWypeQKhVbE9oW/sJaAmjLxhVqacdkvPLEjwlttjfwENRSClS8EjBz0KzRyFSCPDIkuXW34Je/vk7zdB7Q==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "ppc64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "aix"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/android-arm": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/android-arm/-/android-arm-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-QNdQEps7DfFwE3hXiU4BZeOV68HHzYwGd0Nthhd3uCkkEKK7/R6MTgM0P7H7FAs5pU/DIWsviMmEGxEoxIZ+ZQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "android"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/android-arm64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/android-arm64/-/android-arm64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-bBy69pgfhMGtCnwpC/x5QhfxAz/cBgQ9enbtwjf6V9lnPI/hMyT9iWpR1arm0l3kttTr4L0KSLpKmLp/ilKS9A==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "android"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/android-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/android-x64/-/android-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-TVhdVtQIFuVpIIR282btcGC2oGQoSfZfmBdTip2anCaVYcqWlZXGcdcKIUklfX2wj0JklNYgz39OBqh2cqXvcQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "android"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/darwin-arm64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/darwin-arm64/-/darwin-arm64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-Y1giCfM4nlHDWEfSckMzeWNdQS31BQGs9/rouw6Ub91tkK79aIMTH3q9xHvzH8d0wDru5Ci0kWB8b3up/nl16g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/darwin-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/darwin-x64/-/darwin-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-CJsry8ZGM5VFVeyUYB3cdKpd/H69PYez4eJh1W/t38vzutdjEjtP7hB6eLKBoOdxcAlCtEYHzQ/PJ/oU9I4u0A==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/freebsd-arm64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/freebsd-arm64/-/freebsd-arm64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-yYq+39NlTRzU2XmoPW4l5Ifpl9fqSk0nAJYM/V/WUGPEFfek1epLHJIkTQM6bBs1swApjO5nWgvr843g6TjxuQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "freebsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/freebsd-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/freebsd-x64/-/freebsd-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-0FgvOJ6UUMflsHSPLzdfDnnBBVoCDtBTVyn/MrWloUNvq/5SFmh13l3dvgRPkDihRxb77Y17MbqbCAa2strMQQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "freebsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-arm": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-arm/-/linux-arm-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-kro4c0P85GMfFYqW4TWOpvmF8rFShbWGnrLqlzp4X1TNWjRY3JMYUfDCtOxPKOIY8B0WC8HN51hGP4I4hz4AaQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-arm64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-+89UsQTfXdmjIvZS6nUnOOLoXnkUTB9hR5QAeLrQdzOSWZvNSAXAtcRDHWtqAUtAmv7ZM1WPOOeSxDzzzMogiQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-ia32": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-ia32/-/linux-ia32-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-yTEjoapy8UP3rv8dB0ip3AfMpRbyhSN3+hY8mo/i4QXFeDxmiYbEKp3ZRjBKcOP862Ua4b1PDfwlvbuwY7hIGQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "ia32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-loong64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-loong64/-/linux-loong64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-NeqqYkrcGzFwi6CGRGNMOjWGGSYOpqwCjS9fvaUlX5s3zwOtn1qwg1s2iE2svBe4Q/YOG1q6875lcAoQK/F4VA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "loong64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-mips64el": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-mips64el/-/linux-mips64el-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-IcvTlF9dtLrfL/M8WgNI/qJYBENP3ekgsHbYUIzEzq5XJzzVEV/fXY9WFPfEEXmu3ck2qJP8LG/p3Q8f7Zc2Xg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "mips64el"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-ppc64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-ppc64/-/linux-ppc64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-HOy0aLTJTVtoTeGZh4HSXaO6M95qu4k5lJcH4gxv56iaycfz1S8GO/5Jh6X4Y1YiI0h7cRyLi+HixMR+88swag==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "ppc64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-riscv64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-riscv64/-/linux-riscv64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-i8JUDAufpz9jOzo4yIShCTcXzS07vEgWzyX3NH2G7LEFVgrLEhjwL3ajFE4fZI3I4ZgiM7JH3GQ7ReObROvSUA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "riscv64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-s390x": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-s390x/-/linux-s390x-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-jFnu+6UbLlzIjPQpWCNh5QtrcNfMLjgIavnwPQAfoGx4q17ocOU9MsQ2QVvFxwQoWpZT8DvTLooTvmOQXkO51g==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "s390x"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/linux-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-6e0cvXwzOnVWJHq+mskP8DNSrKBr1bULBvnFLpc1KY+d+irZSgZ02TGse5FsafKS5jg2e4pbvK6TPXaF/A6+CA==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "linux"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/netbsd-arm64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/netbsd-arm64/-/netbsd-arm64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-vUnkBYxZW4hL/ie91hSqaSNjulOnYXE1VSLusnvHg2u3jewJBz3YzB9+oCw8DABeVqZGg94t9tyZFoHma8gWZQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "netbsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/netbsd-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/netbsd-x64/-/netbsd-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-XAg8pIQn5CzhOB8odIcAm42QsOfa98SBeKUdo4xa8OvX8LbMZqEtgeWE9P/Wxt7MlG2QqvjGths+nq48TrUiKw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "netbsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/openbsd-arm64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/openbsd-arm64/-/openbsd-arm64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-Ct2WcFEANlFDtp1nVAXSNBPDxyU+j7+tId//iHXU2f/lN5AmO4zLyhDcpR5Cz1r08mVxzt3Jpyt4PmXQ1O6+7A==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "openbsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/openbsd-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/openbsd-x64/-/openbsd-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-xAGGhyOQ9Otm1Xu8NT1ifGLnA6M3sJxZ6ixylb+vIUVzvvd6GOALpwQrYrtlPouMqd/vSbgehz6HaVk4+7Afhw==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "openbsd"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/sunos-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/sunos-x64/-/sunos-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-Mw+tzy4pp6wZEK0+Lwr76pWLjrtjmJyUB23tHKqEDP74R3q95luY/bXqXZeYl4NYlvwOqoRKlInQialgCKy67Q==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "sunos"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/win32-arm64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/win32-arm64/-/win32-arm64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-AVUP428VQTSddguz9dO9ngb+E5aScyg7nOeJDrF1HPYu555gmza3bDGMPhmVXL8svDSoqPCsCPjb265yG/kLKQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "arm64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/win32-ia32": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/win32-ia32/-/win32-ia32-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-i1sW+1i+oWvQzSgfRcxxG2k4I9n3O9NRqy8U+uugaT2Dy7kLO9Y7wI72haOahxceMX8hZAzgGou1FhndRldxRg==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "ia32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@esbuild/win32-x64": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@esbuild/win32-x64/-/win32-x64-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-nOT2vZNw6hJ+z43oP1SPea/G/6AbN6X+bGNhNuq8NtRHy4wsMhw765IKLNmnjek7GvjWBYQ8Q5VBoYTFg9y1UQ==",[m
[32m+[m[32m      "cpu": [[m
[32m+[m[32m        "x64"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "win32"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/@img/sharp-darwin-arm64": {[m
       "version": "0.34.1",[m
       "resolved": "https://registry.npmjs.org/@img/sharp-darwin-arm64/-/sharp-darwin-arm64-0.34.1.tgz",[m
[36m@@ -399,6 +936,66 @@[m
         "url": "https://opencollective.com/libvips"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/@isaacs/fs-minipass": {[m
[32m+[m[32m      "version": "4.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@isaacs/fs-minipass/-/fs-minipass-4.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-wgm9Ehl2jpeqP3zw/7mo3kRHFp5MEDhqAdwy1fTGkHAwnkGOVsgpvQhL8B5n1qlb01jV3n/bI0ZfZp5lWA1k4w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "minipass": "^7.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/gen-mapping": {[m
[32m+[m[32m      "version": "0.3.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/gen-mapping/-/gen-mapping-0.3.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-imAbBGkb+ebQyxKgzv5Hu2nmROxoDOXHh80evxdoXNOrvAnVx7zimzc1Oo5h9RlfV4vPXaE2iM5pOFbvOCClWA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/set-array": "^1.2.1",[m
[32m+[m[32m        "@jridgewell/sourcemap-codec": "^1.4.10",[m
[32m+[m[32m        "@jridgewell/trace-mapping": "^0.3.24"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/resolve-uri": {[m
[32m+[m[32m      "version": "3.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-bRISgCIjP20/tbWSPWMEi54QVPRZExkuD9lJL+UIxUKtwVJA8wW1Trb1jMs1RFXo1CBTNZ/5hpC9QvmKWdopKw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/set-array": {[m
[32m+[m[32m      "version": "1.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/set-array/-/set-array-1.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-R8gLRTZeyp03ymzP/6Lil/28tGeGEzhx1q2k703KGWRAI1VdvPIXdG70VJc2pAMw3NA6JKL5hhFu1sJX0Mnn/A==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/sourcemap-codec": {[m
[32m+[m[32m      "version": "1.5.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-gv3ZRaISU3fjPAgNsriBRqGWQL6quFx04YMPW/zD8XMLsU32mhCCbfbO6KZFLjvYpCZ8zyDEgqsgf+PwPaM7GQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@jridgewell/trace-mapping": {[m
[32m+[m[32m      "version": "0.3.25",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@jridgewell/trace-mapping/-/trace-mapping-0.3.25.tgz",[m
[32m+[m[32m      "integrity": "sha512-vNk6aEwybGtawWmy/PzwnGDOjCkLWSD2wqvjGGAgOAwCGWySYXfYoxt00IJkTF+8Lb57DwOb3Aa0o9CApepiYQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/resolve-uri": "^3.1.0",[m
[32m+[m[32m        "@jridgewell/sourcemap-codec": "^1.4.14"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/@next/env": {[m
       "version": "15.3.1",[m
       "resolved": "https://registry.npmjs.org/@next/env/-/env-15.3.1.tgz",[m
[36m@@ -524,6 +1121,90 @@[m
         "node": ">= 10"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/@panva/hkdf": {[m
[32m+[m[32m      "version": "1.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@panva/hkdf/-/hkdf-1.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-6oclG6Y3PiDFcoyk8srjLfVKyMfVCKJ27JwNPViuXziFpmdz+MZnZN/aKY0JGXgYuO/VghU0jcOAZgWXZ1Dmrw==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@prisma/client": {[m
[32m+[m[32m      "version": "6.8.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@prisma/client/-/client-6.8.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-5II+vbyzv4si6Yunwgkj0qT/iY0zyspttoDrL3R4BYgLdp42/d2C8xdi9vqkrYtKt9H32oFIukvyw3Koz5JoDg==",[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.18"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "prisma": "*",[m
[32m+[m[32m        "typescript": ">=5.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "prisma": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "typescript": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@prisma/config": {[m
[32m+[m[32m      "version": "6.7.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@prisma/config/-/config-6.7.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-di8QDdvSz7DLUi3OOcCHSwxRNeW7jtGRUD2+Z3SdNE3A+pPiNT8WgUJoUyOwJmUr5t+JA2W15P78C/N+8RXrOA==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "esbuild": ">=0.12 <1",[m
[32m+[m[32m        "esbuild-register": "3.6.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@prisma/debug": {[m
[32m+[m[32m      "version": "6.7.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@prisma/debug/-/debug-6.7.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-RabHn9emKoYFsv99RLxvfG2GHzWk2ZI1BuVzqYtmMSIcuGboHY5uFt3Q3boOREM9de6z5s3bQoyKeWnq8Fz22w==",[m
[32m+[m[32m      "devOptional": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@prisma/engines": {[m
[32m+[m[32m      "version": "6.7.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@prisma/engines/-/engines-6.7.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-3wDMesnOxPrOsq++e5oKV9LmIiEazFTRFZrlULDQ8fxdub5w4NgRBoxtWbvXmj2nJVCnzuz6eFix3OhIqsZ1jw==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@prisma/debug": "6.7.0",[m
[32m+[m[32m        "@prisma/engines-version": "6.7.0-36.3cff47a7f5d65c3ea74883f1d736e41d68ce91ed",[m
[32m+[m[32m        "@prisma/fetch-engine": "6.7.0",[m
[32m+[m[32m        "@prisma/get-platform": "6.7.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@prisma/engines-version": {[m
[32m+[m[32m      "version": "6.7.0-36.3cff47a7f5d65c3ea74883f1d736e41d68ce91ed",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@prisma/engines-version/-/engines-version-6.7.0-36.3cff47a7f5d65c3ea74883f1d736e41d68ce91ed.tgz",[m
[32m+[m[32m      "integrity": "sha512-EvpOFEWf1KkJpDsBCrih0kg3HdHuaCnXmMn7XFPObpFTzagK1N0Q0FMnYPsEhvARfANP5Ok11QyoTIRA2hgJTA==",[m
[32m+[m[32m      "devOptional": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@prisma/fetch-engine": {[m
[32m+[m[32m      "version": "6.7.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@prisma/fetch-engine/-/fetch-engine-6.7.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-zLlAGnrkmioPKJR4Yf7NfW3hftcvqeNNEHleMZK9yX7RZSkhmxacAYyfGsCcqRt47jiZ7RKdgE0Wh2fWnm7WsQ==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@prisma/debug": "6.7.0",[m
[32m+[m[32m        "@prisma/engines-version": "6.7.0-36.3cff47a7f5d65c3ea74883f1d736e41d68ce91ed",[m
[32m+[m[32m        "@prisma/get-platform": "6.7.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@prisma/get-platform": {[m
[32m+[m[32m      "version": "6.7.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@prisma/get-platform/-/get-platform-6.7.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-i9IH5lO4fQwnMLvQLYNdgVh9TK3PuWBfQd7QLk/YurnAIg+VeADcZDbmhAi4XBBDD+hDif9hrKyASu0hbjwabw==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@prisma/debug": "6.7.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/@swc/counter": {[m
       "version": "0.1.3",[m
       "resolved": "https://registry.npmjs.org/@swc/counter/-/counter-0.1.3.tgz",[m
[36m@@ -538,44 +1219,52 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/node": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/node/-/node-4.1.4.tgz",[m
[31m-      "integrity": "sha512-MT5118zaiO6x6hNA04OWInuAiP1YISXql8Z+/Y8iisV5nuhM8VXlyhRuqc2PEviPszcXI66W44bCIk500Oolhw==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/node/-/node-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-9rsOpdY9idRI2NH6CL4wORFY0+Q6fnx9XP9Ju+iq/0wJwGD5IByIgFmwVbyy4ymuyprj8Qh4ErxMKTUL4uNh3g==",[m
       "dev": true,[m
       "dependencies": {[m
[32m+[m[32m        "@ampproject/remapping": "^2.3.0",[m
         "enhanced-resolve": "^5.18.1",[m
         "jiti": "^2.4.2",[m
[31m-        "lightningcss": "1.29.2",[m
[31m-        "tailwindcss": "4.1.4"[m
[32m+[m[32m        "lightningcss": "1.30.1",[m
[32m+[m[32m        "magic-string": "^0.30.17",[m
[32m+[m[32m        "source-map-js": "^1.2.1",[m
[32m+[m[32m        "tailwindcss": "4.1.7"[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide/-/oxide-4.1.4.tgz",[m
[31m-      "integrity": "sha512-p5wOpXyOJx7mKh5MXh5oKk+kqcz8T+bA3z/5VWWeQwFrmuBItGwz8Y2CHk/sJ+dNb9B0nYFfn0rj/cKHZyjahQ==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide/-/oxide-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-5SF95Ctm9DFiUyjUPnDGkoKItPX/k+xifcQhcqX5RA85m50jw1pT/KzjdvlqxRja45Y52nR4MR9fD1JYd7f8NQ==",[m
       "dev": true,[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "detect-libc": "^2.0.4",[m
[32m+[m[32m        "tar": "^7.4.3"[m
[32m+[m[32m      },[m
       "engines": {[m
         "node": ">= 10"[m
       },[m
       "optionalDependencies": {[m
[31m-        "@tailwindcss/oxide-android-arm64": "4.1.4",[m
[31m-        "@tailwindcss/oxide-darwin-arm64": "4.1.4",[m
[31m-        "@tailwindcss/oxide-darwin-x64": "4.1.4",[m
[31m-        "@tailwindcss/oxide-freebsd-x64": "4.1.4",[m
[31m-        "@tailwindcss/oxide-linux-arm-gnueabihf": "4.1.4",[m
[31m-        "@tailwindcss/oxide-linux-arm64-gnu": "4.1.4",[m
[31m-        "@tailwindcss/oxide-linux-arm64-musl": "4.1.4",[m
[31m-        "@tailwindcss/oxide-linux-x64-gnu": "4.1.4",[m
[31m-        "@tailwindcss/oxide-linux-x64-musl": "4.1.4",[m
[31m-        "@tailwindcss/oxide-wasm32-wasi": "4.1.4",[m
[31m-        "@tailwindcss/oxide-win32-arm64-msvc": "4.1.4",[m
[31m-        "@tailwindcss/oxide-win32-x64-msvc": "4.1.4"[m
[32m+[m[32m        "@tailwindcss/oxide-android-arm64": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-darwin-arm64": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-darwin-x64": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-freebsd-x64": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-arm-gnueabihf": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-arm64-gnu": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-arm64-musl": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-x64-gnu": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-linux-x64-musl": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-wasm32-wasi": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-win32-arm64-msvc": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide-win32-x64-msvc": "4.1.7"[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-android-arm64": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-android-arm64/-/oxide-android-arm64-4.1.4.tgz",[m
[31m-      "integrity": "sha512-xMMAe/SaCN/vHfQYui3fqaBDEXMu22BVwQ33veLc8ep+DNy7CWN52L+TTG9y1K397w9nkzv+Mw+mZWISiqhmlA==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-android-arm64/-/oxide-android-arm64-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-IWA410JZ8fF7kACus6BrUwY2Z1t1hm0+ZWNEzykKmMNM09wQooOcN/VXr0p/WJdtHZ90PvJf2AIBS/Ceqx1emg==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -589,9 +1278,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-darwin-arm64": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-darwin-arm64/-/oxide-darwin-arm64-4.1.4.tgz",[m
[31m-      "integrity": "sha512-JGRj0SYFuDuAGilWFBlshcexev2hOKfNkoX+0QTksKYq2zgF9VY/vVMq9m8IObYnLna0Xlg+ytCi2FN2rOL0Sg==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-darwin-arm64/-/oxide-darwin-arm64-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-81jUw9To7fimGGkuJ2W5h3/oGonTOZKZ8C2ghm/TTxbwvfSiFSDPd6/A/KE2N7Jp4mv3Ps9OFqg2fEKgZFfsvg==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -605,9 +1294,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-darwin-x64": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-darwin-x64/-/oxide-darwin-x64-4.1.4.tgz",[m
[31m-      "integrity": "sha512-sdDeLNvs3cYeWsEJ4H1DvjOzaGios4QbBTNLVLVs0XQ0V95bffT3+scptzYGPMjm7xv4+qMhCDrkHwhnUySEzA==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-darwin-x64/-/oxide-darwin-x64-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-q77rWjEyGHV4PdDBtrzO0tgBBPlQWKY7wZK0cUok/HaGgbNKecegNxCGikuPJn5wFAlIywC3v+WMBt0PEBtwGw==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -621,9 +1310,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-freebsd-x64": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-freebsd-x64/-/oxide-freebsd-x64-4.1.4.tgz",[m
[31m-      "integrity": "sha512-VHxAqxqdghM83HslPhRsNhHo91McsxRJaEnShJOMu8mHmEj9Ig7ToHJtDukkuLWLzLboh2XSjq/0zO6wgvykNA==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-freebsd-x64/-/oxide-freebsd-x64-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-RfmdbbK6G6ptgF4qqbzoxmH+PKfP4KSVs7SRlTwcbRgBwezJkAO3Qta/7gDy10Q2DcUVkKxFLXUQO6J3CRvBGw==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -637,9 +1326,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-linux-arm-gnueabihf": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm-gnueabihf/-/oxide-linux-arm-gnueabihf-4.1.4.tgz",[m
[31m-      "integrity": "sha512-OTU/m/eV4gQKxy9r5acuesqaymyeSCnsx1cFto/I1WhPmi5HDxX1nkzb8KYBiwkHIGg7CTfo/AcGzoXAJBxLfg==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm-gnueabihf/-/oxide-linux-arm-gnueabihf-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-OZqsGvpwOa13lVd1z6JVwQXadEobmesxQ4AxhrwRiPuE04quvZHWn/LnihMg7/XkN+dTioXp/VMu/p6A5eZP3g==",[m
       "cpu": [[m
         "arm"[m
       ],[m
[36m@@ -653,9 +1342,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-linux-arm64-gnu": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-gnu/-/oxide-linux-arm64-gnu-4.1.4.tgz",[m
[31m-      "integrity": "sha512-hKlLNvbmUC6z5g/J4H+Zx7f7w15whSVImokLPmP6ff1QqTVE+TxUM9PGuNsjHvkvlHUtGTdDnOvGNSEUiXI1Ww==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-gnu/-/oxide-linux-arm64-gnu-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-voMvBTnJSfKecJxGkoeAyW/2XRToLZ227LxswLAwKY7YslG/Xkw9/tJNH+3IVh5bdYzYE7DfiaPbRkSHFxY1xA==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -669,9 +1358,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-linux-arm64-musl": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-musl/-/oxide-linux-arm64-musl-4.1.4.tgz",[m
[31m-      "integrity": "sha512-X3As2xhtgPTY/m5edUtddmZ8rCruvBvtxYLMw9OsZdH01L2gS2icsHRwxdU0dMItNfVmrBezueXZCHxVeeb7Aw==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-arm64-musl/-/oxide-linux-arm64-musl-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-PjGuNNmJeKHnP58M7XyjJyla8LPo+RmwHQpBI+W/OxqrwojyuCQ+GUtygu7jUqTEexejZHr/z3nBc/gTiXBj4A==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -685,9 +1374,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-linux-x64-gnu": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-x64-gnu/-/oxide-linux-x64-gnu-4.1.4.tgz",[m
[31m-      "integrity": "sha512-2VG4DqhGaDSmYIu6C4ua2vSLXnJsb/C9liej7TuSO04NK+JJJgJucDUgmX6sn7Gw3Cs5ZJ9ZLrnI0QRDOjLfNQ==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-x64-gnu/-/oxide-linux-x64-gnu-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-HMs+Va+ZR3gC3mLZE00gXxtBo3JoSQxtu9lobbZd+DmfkIxR54NO7Z+UQNPsa0P/ITn1TevtFxXTpsRU7qEvWg==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -701,9 +1390,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-linux-x64-musl": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-x64-musl/-/oxide-linux-x64-musl-4.1.4.tgz",[m
[31m-      "integrity": "sha512-v+mxVgH2kmur/X5Mdrz9m7TsoVjbdYQT0b4Z+dr+I4RvreCNXyCFELZL/DO0M1RsidZTrm6O1eMnV6zlgEzTMQ==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-linux-x64-musl/-/oxide-linux-x64-musl-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-MHZ6jyNlutdHH8rd+YTdr3QbXrHXqwIhHw9e7yXEBcQdluGwhpQY2Eku8UZK6ReLaWtQ4gijIv5QoM5eE+qlsA==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -717,9 +1406,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-wasm32-wasi": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-wasm32-wasi/-/oxide-wasm32-wasi-4.1.4.tgz",[m
[31m-      "integrity": "sha512-2TLe9ir+9esCf6Wm+lLWTMbgklIjiF0pbmDnwmhR9MksVOq+e8aP3TSsXySnBDDvTTVd/vKu1aNttEGj3P6l8Q==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-wasm32-wasi/-/oxide-wasm32-wasi-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-ANaSKt74ZRzE2TvJmUcbFQ8zS201cIPxUDm5qez5rLEwWkie2SkGtA4P+GPTj+u8N6JbPrC8MtY8RmJA35Oo+A==",[m
       "bundleDependencies": [[m
         "@napi-rs/wasm-runtime",[m
         "@emnapi/core",[m
[36m@@ -734,10 +1423,10 @@[m
       "dev": true,[m
       "optional": true,[m
       "dependencies": {[m
[31m-        "@emnapi/core": "^1.4.0",[m
[31m-        "@emnapi/runtime": "^1.4.0",[m
[31m-        "@emnapi/wasi-threads": "^1.0.1",[m
[31m-        "@napi-rs/wasm-runtime": "^0.2.8",[m
[32m+[m[32m        "@emnapi/core": "^1.4.3",[m
[32m+[m[32m        "@emnapi/runtime": "^1.4.3",[m
[32m+[m[32m        "@emnapi/wasi-threads": "^1.0.2",[m
[32m+[m[32m        "@napi-rs/wasm-runtime": "^0.2.9",[m
         "@tybys/wasm-util": "^0.9.0",[m
         "tslib": "^2.8.0"[m
       },[m
[36m@@ -746,9 +1435,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-win32-arm64-msvc": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-win32-arm64-msvc/-/oxide-win32-arm64-msvc-4.1.4.tgz",[m
[31m-      "integrity": "sha512-VlnhfilPlO0ltxW9/BgfLI5547PYzqBMPIzRrk4W7uupgCt8z6Trw/tAj6QUtF2om+1MH281Pg+HHUJoLesmng==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-win32-arm64-msvc/-/oxide-win32-arm64-msvc-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-HUiSiXQ9gLJBAPCMVRk2RT1ZrBjto7WvqsPBwUrNK2BcdSxMnk19h4pjZjI7zgPhDxlAbJSumTC4ljeA9y0tEw==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -762,9 +1451,9 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/oxide-win32-x64-msvc": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-win32-x64-msvc/-/oxide-win32-x64-msvc-4.1.4.tgz",[m
[31m-      "integrity": "sha512-+7S63t5zhYjslUGb8NcgLpFXD+Kq1F/zt5Xv5qTv7HaFTG/DHyHD9GA6ieNAxhgyA4IcKa/zy7Xx4Oad2/wuhw==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/oxide-win32-x64-msvc/-/oxide-win32-x64-msvc-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-rYHGmvoHiLJ8hWucSfSOEmdCBIGZIq7SpkPRSqLsH2Ab2YUNgKeAPT1Fi2cx3+hnYOrAb0jp9cRyode3bBW4mQ==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -778,16 +1467,33 @@[m
       }[m
     },[m
     "node_modules/@tailwindcss/postcss": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/@tailwindcss/postcss/-/postcss-4.1.4.tgz",[m
[31m-      "integrity": "sha512-bjV6sqycCEa+AQSt2Kr7wpGF1bOZJ5wsqnLEkqSbM/JEHxx/yhMH8wHmdkPyApF9xhHeMSwnnkDUUMMM/hYnXw==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/postcss/-/postcss-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-88g3qmNZn7jDgrrcp3ZXEQfp9CVox7xjP1HN2TFKI03CltPVd/c61ydn5qJJL8FYunn0OqBaW5HNUga0kmPVvw==",[m
       "dev": true,[m
       "dependencies": {[m
         "@alloc/quick-lru": "^5.2.0",[m
[31m-        "@tailwindcss/node": "4.1.4",[m
[31m-        "@tailwindcss/oxide": "4.1.4",[m
[32m+[m[32m        "@tailwindcss/node": "4.1.7",[m
[32m+[m[32m        "@tailwindcss/oxide": "4.1.7",[m
         "postcss": "^8.4.41",[m
[31m-        "tailwindcss": "4.1.4"[m
[32m+[m[32m        "tailwindcss": "4.1.7"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/cookie": {[m
[32m+[m[32m      "version": "0.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/cookie/-/cookie-0.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-4Kh9a6B2bQciAhf7FSuMRRkUWecJgJu9nPnx3yzpsfXX/c50REIqpHY4C82bXP90qrLtXtkDxTZosYO3UpOwlA==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@types/next-auth": {[m
[32m+[m[32m      "version": "3.15.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/next-auth/-/next-auth-3.15.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZVfejlu81YiIRX1m0iKAfvZ3nK7K9EyZWhNARNKsFop8kNAgEvMnlKpTpwN59xkK2OhyWLagPuiDAVBYSO9jSA==",[m
[32m+[m[32m      "deprecated": "This is a stub types definition. next-auth provides its own type definitions, so you do not need this installed.",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "next-auth": "*"[m
       }[m
     },[m
     "node_modules/@types/node": {[m
[36m@@ -803,7 +1509,6 @@[m
       "version": "19.1.2",[m
       "resolved": "https://registry.npmjs.org/@types/react/-/react-19.1.2.tgz",[m
       "integrity": "sha512-oxLPMytKchWGbnQM9O7D67uPa9paTNxO7jVoNMXgkkErULBPhPARCfkKL9ytcIJJRGjbsVwW4ugJzyFFvm/Tiw==",[m
[31m-      "dev": true,[m
       "dependencies": {[m
         "csstype": "^3.0.2"[m
       }[m
[36m@@ -817,6 +1522,88 @@[m
         "@types/react": "^19.0.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/@types/react-transition-group": {[m
[32m+[m[32m      "version": "4.4.12",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/react-transition-group/-/react-transition-group-4.4.12.tgz",[m
[32m+[m[32m      "integrity": "sha512-8TV6R3h2j7a91c+1DXdJi3Syo69zzIZbz7Lg5tORM5LEJG7X/E6a1V3drRyBRZq7/utz7A+c4OgYLiLcYGHG6w==",[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@types/react": "*"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/autoprefixer": {[m
[32m+[m[32m      "version": "10.4.21",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/autoprefixer/-/autoprefixer-10.4.21.tgz",[m
[32m+[m[32m      "integrity": "sha512-O+A6LWV5LDHSJD3LjHYoNi4VLsj/Whi7k6zG12xTYaU4cQ8oxQGckXNX8cRHK5yOZ/ppVHe0ZBXGzSV9jXdVbQ==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "opencollective",[m
[32m+[m[32m          "url": "https://opencollective.com/postcss/"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "tidelift",[m
[32m+[m[32m          "url": "https://tidelift.com/funding/github/npm/autoprefixer"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/ai"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "browserslist": "^4.24.4",[m
[32m+[m[32m        "caniuse-lite": "^1.0.30001702",[m
[32m+[m[32m        "fraction.js": "^4.3.7",[m
[32m+[m[32m        "normalize-range": "^0.1.2",[m
[32m+[m[32m        "picocolors": "^1.1.1",[m
[32m+[m[32m        "postcss-value-parser": "^4.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "autoprefixer": "bin/autoprefixer"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^10 || ^12 || >=14"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "postcss": "^8.1.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/boolbase": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/boolbase/-/boolbase-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-JZOSA7Mo9sNGB8+UjSgzdLtokWAky1zbztM3WRLCbZ70/3cTANmQmOdR7y2g+J0e2WXywy1yS468tY+IruqEww=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/browserslist": {[m
[32m+[m[32m      "version": "4.24.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/browserslist/-/browserslist-4.24.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-FDToo4Wo82hIdgc1CQ+NQD0hEhmpPjrZ3hiUgwgOG6IuTdlpr8jdjyG24P6cNP1yJpTLzS5OcGgSw0xmDU1/Tw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "opencollective",[m
[32m+[m[32m          "url": "https://opencollective.com/browserslist"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "tidelift",[m
[32m+[m[32m          "url": "https://tidelift.com/funding/github/npm/browserslist"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/ai"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "caniuse-lite": "^1.0.30001716",[m
[32m+[m[32m        "electron-to-chromium": "^1.5.149",[m
[32m+[m[32m        "node-releases": "^2.0.19",[m
[32m+[m[32m        "update-browserslist-db": "^1.1.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "browserslist": "cli.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^6 || ^7 || ^8 || ^9 || ^10 || ^11 || ^12 || >=13.7"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/busboy": {[m
       "version": "1.6.0",[m
       "resolved": "https://registry.npmjs.org/busboy/-/busboy-1.6.0.tgz",[m
[36m@@ -829,9 +1616,9 @@[m
       }[m
     },[m
     "node_modules/caniuse-lite": {[m
[31m-      "version": "1.0.30001715",[m
[31m-      "resolved": "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001715.tgz",[m
[31m-      "integrity": "sha512-7ptkFGMm2OAOgvZpwgA4yjQ5SQbrNVGdRjzH0pBdy1Fasvcr+KAeECmbCAECzTuDuoX0FCY8KzUxjf9+9kfZEw==",[m
[32m+[m[32m      "version": "1.0.30001718",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001718.tgz",[m
[32m+[m[32m      "integrity": "sha512-AflseV1ahcSunK53NfEs9gFWgOEmzr0f+kaMFA4xiLZlr9Hzt7HxcSpIFcnNCUkz6R6dWKa54rUz3HUmI3nVcw==",[m
       "funding": [[m
         {[m
           "type": "opencollective",[m
[36m@@ -847,6 +1634,55 @@[m
         }[m
       ][m
     },[m
[32m+[m[32m    "node_modules/cheerio": {[m
[32m+[m[32m      "version": "1.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cheerio/-/cheerio-1.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-+0hMx9eYhJvWbgpKV9hN7jg0JcwydpopZE4hgi+KvQtByZXPp04NiCWU0LzcAbP63abZckIHkTQaXVF52mX3xQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "cheerio-select": "^2.1.0",[m
[32m+[m[32m        "dom-serializer": "^2.0.0",[m
[32m+[m[32m        "domhandler": "^5.0.3",[m
[32m+[m[32m        "domutils": "^3.2.2",[m
[32m+[m[32m        "encoding-sniffer": "^0.2.0",[m
[32m+[m[32m        "htmlparser2": "^10.0.0",[m
[32m+[m[32m        "parse5": "^7.3.0",[m
[32m+[m[32m        "parse5-htmlparser2-tree-adapter": "^7.1.0",[m
[32m+[m[32m        "parse5-parser-stream": "^7.1.2",[m
[32m+[m[32m        "undici": "^7.10.0",[m
[32m+[m[32m        "whatwg-mimetype": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.17"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/cheeriojs/cheerio?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cheerio-select": {[m
[32m+[m[32m      "version": "2.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cheerio-select/-/cheerio-select-2.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-9v9kG0LvzrlcungtnJtpGNxY+fzECQKhK4EGJX2vByejiMX84MFNQw4UxPJl3bFbTMw+Dfs37XaIkCwTZfLh4g==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "boolbase": "^1.0.0",[m
[32m+[m[32m        "css-select": "^5.1.0",[m
[32m+[m[32m        "css-what": "^6.1.0",[m
[32m+[m[32m        "domelementtype": "^2.3.0",[m
[32m+[m[32m        "domhandler": "^5.0.3",[m
[32m+[m[32m        "domutils": "^3.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/fb55"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/chownr": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/chownr/-/chownr-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-+IxzY9BZOQd/XuYPRmrvEVjF/nqj5kgT4kEq7VofrDoM1MxoRjEWkrCC3EtLi59TVawxTAn+orJwFQcrqEN1+g==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/client-only": {[m
       "version": "0.0.1",[m
       "resolved": "https://registry.npmjs.org/client-only/-/client-only-0.0.1.tgz",[m
[36m@@ -889,44 +1725,328 @@[m
       "integrity": "sha512-shrVawQFojnZv6xM40anx4CkoDP+fZsw/ZerEMsW/pyzsRbElpsL/DBVW7q3ExxwusdNXI3lXpuhEZkzs8p5Eg==",[m
       "optional": true,[m
       "dependencies": {[m
[31m-        "color-name": "^1.0.0",[m
[31m-        "simple-swizzle": "^0.2.2"[m
[32m+[m[32m        "color-name": "^1.0.0",[m
[32m+[m[32m        "simple-swizzle": "^0.2.2"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/coloring-console": {[m
[32m+[m[32m      "version": "1.0.22",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/coloring-console/-/coloring-console-1.0.22.tgz",[m
[32m+[m[32m      "integrity": "sha512-WxT60qUgS5ft8sHndTzpiEdQ2cRST4O3LuxWYBzy/aO/h6Aany0fsu+YZTMnKE1RfWaOf6wucUUfyp5WKHD89g=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cookie": {[m
[32m+[m[32m      "version": "0.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-U71cyTamuh1CRNCfpGY6to28lxvNwPG4Guz/EVjgf3Jmzv0vlDp1atT9eS5dDjMYHucpHbWns6Lwf3BKz6svdw==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/css-select": {[m
[32m+[m[32m      "version": "5.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/css-select/-/css-select-5.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-TizTzUddG/xYLA3NXodFM0fSbNizXjOKhqiQQwvhlspadZokn1KDy0NZFS0wuEubIYAV5/c1/lAr0TaaFXEXzw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "boolbase": "^1.0.0",[m
[32m+[m[32m        "css-what": "^6.1.0",[m
[32m+[m[32m        "domhandler": "^5.0.2",[m
[32m+[m[32m        "domutils": "^3.0.1",[m
[32m+[m[32m        "nth-check": "^2.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/fb55"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/css-what": {[m
[32m+[m[32m      "version": "6.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/css-what/-/css-what-6.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-u/O3vwbptzhMs3L1fQE82ZSLHQQfto5gyZzwteVIEyeaY5Fc7R4dapF/BvRoSYFeqfBk4m0V1Vafq5Pjv25wvA==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/fb55"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/csstype": {[m
[32m+[m[32m      "version": "3.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/csstype/-/csstype-3.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-M1uQkMl8rQK/szD0LNhtqxIPLpimGm8sOBwU7lLnCpSbTyY3yeU1Vc7l4KT5zT4s/yOxHH5O7tIuuLOCnLADRw=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/debug": {[m
[32m+[m[32m      "version": "4.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/debug/-/debug-4.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-6WTZ/IxCY/T6BALoZHaE4ctp9xm+Z5kY/pzYaCHRFeyVhojxlrm+46y68HA6hr0TcwEssoxNiDEUJQjfPZ/RYA==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ms": "^2.1.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "supports-color": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/detect-libc": {[m
[32m+[m[32m      "version": "2.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/detect-libc/-/detect-libc-2.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-3UDv+G9CsCKO1WKMGw9fwq/SWJYbI0c5Y7LU1AXYoDdbhE2AHQ6N6Nb34sG8Fj7T5APy8qXDCKuuIHd1BR0tVA==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/dom-helpers": {[m
[32m+[m[32m      "version": "5.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/dom-helpers/-/dom-helpers-5.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-nRCa7CK3VTrM2NmGkIy4cbK7IZlgBE/PYMn55rrXefr5xXDP0LdtfPnblFDoVdcAfslJ7or6iqAUnx0CCGIWQA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.8.7",[m
[32m+[m[32m        "csstype": "^3.0.2"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/dom-serializer": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/dom-serializer/-/dom-serializer-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-wIkAryiqt/nV5EQKqQpo3SToSOV9J0DnbJqwK7Wv/Trc92zIAYZ4FlMu+JPFW1DfGFt81ZTCGgDEabffXeLyJg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "domelementtype": "^2.3.0",[m
[32m+[m[32m        "domhandler": "^5.0.2",[m
[32m+[m[32m        "entities": "^4.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/cheeriojs/dom-serializer?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/domelementtype": {[m
[32m+[m[32m      "version": "2.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/domelementtype/-/domelementtype-2.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-OLETBj6w0OsagBwdXnPdN0cnMfF9opN69co+7ZrbfPGrdpPVNBUj02spi6B1N7wChLQiPn4CSH/zJvXw56gmHw==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/fb55"[m
[32m+[m[32m        }[m
[32m+[m[32m      ][m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/domhandler": {[m
[32m+[m[32m      "version": "5.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/domhandler/-/domhandler-5.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-cgwlv/1iFQiFnU96XXgROh8xTeetsnJiDsTc7TYCLFd9+/WNkIqPTxiM/8pSd8VIrhXGTf1Ny1q1hquVqDJB5w==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "domelementtype": "^2.3.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/fb55/domhandler?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/domutils": {[m
[32m+[m[32m      "version": "3.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/domutils/-/domutils-3.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-6kZKyUajlDuqlHKVX1w7gyslj9MPIXzIFiz/rGu35uC1wMi+kMhQwGhl4lt9unC9Vb9INnY9Z3/ZA3+FhASLaw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "dom-serializer": "^2.0.0",[m
[32m+[m[32m        "domelementtype": "^2.3.0",[m
[32m+[m[32m        "domhandler": "^5.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/fb55/domutils?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/electron-to-chromium": {[m
[32m+[m[32m      "version": "1.5.155",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.5.155.tgz",[m
[32m+[m[32m      "integrity": "sha512-ps5KcGGmwL8VaeJlvlDlu4fORQpv3+GIcF5I3f9tUKUlJ/wsysh6HU8P5L1XWRYeXfA0oJd4PyM8ds8zTFf6Ng==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/encoding-sniffer": {[m
[32m+[m[32m      "version": "0.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/encoding-sniffer/-/encoding-sniffer-0.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-5gvq20T6vfpekVtqrYQsSCFZ1wEg5+wW0/QaZMWkFr6BqD3NfKs0rLCx4rrVlSWJeZb5NBJgVLswK/w2MWU+Gw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "iconv-lite": "^0.6.3",[m
[32m+[m[32m        "whatwg-encoding": "^3.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/fb55/encoding-sniffer?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/enhanced-resolve": {[m
[32m+[m[32m      "version": "5.18.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/enhanced-resolve/-/enhanced-resolve-5.18.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZSW3ma5GkcQBIpwZTSRAI8N71Uuwgs93IezB7mf7R60tC8ZbJideoDNKjHn2O9KIlx6rkGTTEk1xUCK2E1Y2Yg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "graceful-fs": "^4.2.4",[m
[32m+[m[32m        "tapable": "^2.2.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10.13.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/entities": {[m
[32m+[m[32m      "version": "4.5.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/entities/-/entities-4.5.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-V0hjH4dGPh9Ao5p0MoRY6BVqtwCjhz6vI5LT8AJ55H+4g9/4vbHx1I54fS0XuclLhDHArPQCiMjDxjaL8fPxhw==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.12"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/fb55/entities?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/esbuild": {[m
[32m+[m[32m      "version": "0.25.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/esbuild/-/esbuild-0.25.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-8pgjLUcUjcgDg+2Q4NYXnPbo/vncAY4UmyaCm0jZevERqCHZIaWwdJHkf8XQtu4AxSKCdvrUbT0XUr1IdZzI8Q==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "esbuild": "bin/esbuild"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      },[m
[32m+[m[32m      "optionalDependencies": {[m
[32m+[m[32m        "@esbuild/aix-ppc64": "0.25.4",[m
[32m+[m[32m        "@esbuild/android-arm": "0.25.4",[m
[32m+[m[32m        "@esbuild/android-arm64": "0.25.4",[m
[32m+[m[32m        "@esbuild/android-x64": "0.25.4",[m
[32m+[m[32m        "@esbuild/darwin-arm64": "0.25.4",[m
[32m+[m[32m        "@esbuild/darwin-x64": "0.25.4",[m
[32m+[m[32m        "@esbuild/freebsd-arm64": "0.25.4",[m
[32m+[m[32m        "@esbuild/freebsd-x64": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-arm": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-arm64": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-ia32": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-loong64": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-mips64el": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-ppc64": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-riscv64": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-s390x": "0.25.4",[m
[32m+[m[32m        "@esbuild/linux-x64": "0.25.4",[m
[32m+[m[32m        "@esbuild/netbsd-arm64": "0.25.4",[m
[32m+[m[32m        "@esbuild/netbsd-x64": "0.25.4",[m
[32m+[m[32m        "@esbuild/openbsd-arm64": "0.25.4",[m
[32m+[m[32m        "@esbuild/openbsd-x64": "0.25.4",[m
[32m+[m[32m        "@esbuild/sunos-x64": "0.25.4",[m
[32m+[m[32m        "@esbuild/win32-arm64": "0.25.4",[m
[32m+[m[32m        "@esbuild/win32-ia32": "0.25.4",[m
[32m+[m[32m        "@esbuild/win32-x64": "0.25.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/esbuild-register": {[m
[32m+[m[32m      "version": "3.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/esbuild-register/-/esbuild-register-3.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-H2/S7Pm8a9CL1uhp9OvjwrBh5Pvx0H8qVOxNu8Wed9Y7qv56MPtq+GGM8RJpq6glYJn9Wspr8uw7l55uyinNeg==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "debug": "^4.3.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "esbuild": ">=0.12 <1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/escalade": {[m
[32m+[m[32m      "version": "3.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/escalade/-/escalade-3.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-WUj2qlxaQtO4g6Pq5c29GTcWGDyd8itL8zTlipgECz3JesAiiOKotd8JU6otB3PACgG6xkJUyVhboMS+bje/jA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/eventemitter3": {[m
[32m+[m[32m      "version": "5.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/eventemitter3/-/eventemitter3-5.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-GWkBvjiSZK87ELrYOSESUYeVIc9mvLLf/nXalMOS5dYrgZq9o5OVkbZAVM06CVxYsCwH9BDZFPlQTlPA1j4ahA=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fast-diff": {[m
[32m+[m[32m      "version": "1.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fast-diff/-/fast-diff-1.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-VxPP4NqbUjj6MaAOafWeUn2cXWLcCtljklUtZf0Ind4XQ+QPtmA0b18zZy0jIQx+ExRVCR/ZQpBmik5lXshNsw=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fraction.js": {[m
[32m+[m[32m      "version": "4.3.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fraction.js/-/fraction.js-4.3.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZsDfxO51wGAXREY55a7la9LScWpwv9RxIrYABrlvOFBlH/ShPnrtsXeuUIfXKKOVicNxQ+o8JTbJvjS4M89yew==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "*"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "patreon",[m
[32m+[m[32m        "url": "https://github.com/sponsors/rawify"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fsevents": {[m
[32m+[m[32m      "version": "2.3.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fsevents/-/fsevents-2.3.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-5xoDfX+fL7faATnagmWPpbFtwh/R77WmMMqqHGS65C3vvB0YHrgF+B1YmZ3441tMj5n63k0212XNoJwzlhffQw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "os": [[m
[32m+[m[32m        "darwin"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^8.16.0 || ^10.6.0 || >=11.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/graceful-fs": {[m
[32m+[m[32m      "version": "4.2.11",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz",[m
[32m+[m[32m      "integrity": "sha512-RbJ5/jmFcNNCcDV5o9eTnBLJ/HszWV0P73bc+Ff4nS/rJj+YaS6IGyiOL0VoBYX+l1Wrl3k63h/KrH+nhJ0XvQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/htmlparser2": {[m
[32m+[m[32m      "version": "10.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/htmlparser2/-/htmlparser2-10.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-TwAZM+zE5Tq3lrEHvOlvwgj1XLWQCtaaibSN11Q+gGBAS7Y1uZSWwXXRe4iF6OXnaq1riyQAPFOBtYc77Mxq0g==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        "https://github.com/fb55/htmlparser2?sponsor=1",[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/fb55"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "domelementtype": "^2.3.0",[m
[32m+[m[32m        "domhandler": "^5.0.3",[m
[32m+[m[32m        "domutils": "^3.2.1",[m
[32m+[m[32m        "entities": "^6.0.0"[m
       }[m
     },[m
[31m-    "node_modules/csstype": {[m
[31m-      "version": "3.1.3",[m
[31m-      "resolved": "https://registry.npmjs.org/csstype/-/csstype-3.1.3.tgz",[m
[31m-      "integrity": "sha512-M1uQkMl8rQK/szD0LNhtqxIPLpimGm8sOBwU7lLnCpSbTyY3yeU1Vc7l4KT5zT4s/yOxHH5O7tIuuLOCnLADRw==",[m
[31m-      "dev": true[m
[31m-    },[m
[31m-    "node_modules/detect-libc": {[m
[31m-      "version": "2.0.4",[m
[31m-      "resolved": "https://registry.npmjs.org/detect-libc/-/detect-libc-2.0.4.tgz",[m
[31m-      "integrity": "sha512-3UDv+G9CsCKO1WKMGw9fwq/SWJYbI0c5Y7LU1AXYoDdbhE2AHQ6N6Nb34sG8Fj7T5APy8qXDCKuuIHd1BR0tVA==",[m
[31m-      "devOptional": true,[m
[32m+[m[32m    "node_modules/htmlparser2/node_modules/entities": {[m
[32m+[m[32m      "version": "6.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/entities/-/entities-6.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-aN97NXWF6AWBTahfVOIrB/NShkzi5H7F9r1s9mD3cDj4Ko5f2qhhVoYMibXF7GlLveb/D2ioWay8lxI97Ven3g==",[m
       "engines": {[m
[31m-        "node": ">=8"[m
[32m+[m[32m        "node": ">=0.12"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/fb55/entities?sponsor=1"[m
       }[m
     },[m
[31m-    "node_modules/enhanced-resolve": {[m
[31m-      "version": "5.18.1",[m
[31m-      "resolved": "https://registry.npmjs.org/enhanced-resolve/-/enhanced-resolve-5.18.1.tgz",[m
[31m-      "integrity": "sha512-ZSW3ma5GkcQBIpwZTSRAI8N71Uuwgs93IezB7mf7R60tC8ZbJideoDNKjHn2O9KIlx6rkGTTEk1xUCK2E1Y2Yg==",[m
[31m-      "dev": true,[m
[32m+[m[32m    "node_modules/iconv-lite": {[m
[32m+[m[32m      "version": "0.6.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-4fCk79wshMdzMp2rH06qWrJE4iolqLhCUH+OiuIgU++RB0+94NlDL81atO7GX55uUKueo0txHNtvEyI6D7WdMw==",[m
       "dependencies": {[m
[31m-        "graceful-fs": "^4.2.4",[m
[31m-        "tapable": "^2.2.0"[m
[32m+[m[32m        "safer-buffer": ">= 2.1.2 < 3.0.0"[m
       },[m
       "engines": {[m
[31m-        "node": ">=10.13.0"[m
[32m+[m[32m        "node": ">=0.10.0"[m
       }[m
     },[m
[31m-    "node_modules/graceful-fs": {[m
[31m-      "version": "4.2.11",[m
[31m-      "resolved": "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz",[m
[31m-      "integrity": "sha512-RbJ5/jmFcNNCcDV5o9eTnBLJ/HszWV0P73bc+Ff4nS/rJj+YaS6IGyiOL0VoBYX+l1Wrl3k63h/KrH+nhJ0XvQ==",[m
[31m-      "dev": true[m
[31m-    },[m
     "node_modules/is-arrayish": {[m
       "version": "0.3.2",[m
       "resolved": "https://registry.npmjs.org/is-arrayish/-/is-arrayish-0.3.2.tgz",[m
[36m@@ -942,10 +2062,25 @@[m
         "jiti": "lib/jiti-cli.mjs"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/jose": {[m
[32m+[m[32m      "version": "5.10.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/jose/-/jose-5.10.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-s+3Al/p9g32Iq+oqXxkW//7jk2Vig6FF1CFqzVXoTUXt2qz89YWbL+OwS17NFYEvxC35n0FKeGO2LGYSxeM2Gg==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/js-tokens": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-RdJUflcE3cUzKiMqQgsCu06FPu9UdIJO0beYbPhHN4k6apgJtifcoCtT9bcxOpYBtpD2kCM6Sbzg4CausW/PKQ=="[m
[32m+[m[32m    },[m
     "node_modules/lightningcss": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss/-/lightningcss-1.29.2.tgz",[m
[31m-      "integrity": "sha512-6b6gd/RUXKaw5keVdSEtqFVdzWnU5jMxTUjA2bVcMNPLwSQ08Sv/UodBVtETLCn7k4S1Ibxwh7k68IwLZPgKaA==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss/-/lightningcss-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-xi6IyHML+c9+Q3W0S4fCQJOym42pyurFiJUHEcEyHS0CeKzia4yZDEsLlqOFykxOdHpNy0NmvVO31vcSqAxJCg==",[m
       "dev": true,[m
       "dependencies": {[m
         "detect-libc": "^2.0.3"[m
[36m@@ -958,22 +2093,22 @@[m
         "url": "https://opencollective.com/parcel"[m
       },[m
       "optionalDependencies": {[m
[31m-        "lightningcss-darwin-arm64": "1.29.2",[m
[31m-        "lightningcss-darwin-x64": "1.29.2",[m
[31m-        "lightningcss-freebsd-x64": "1.29.2",[m
[31m-        "lightningcss-linux-arm-gnueabihf": "1.29.2",[m
[31m-        "lightningcss-linux-arm64-gnu": "1.29.2",[m
[31m-        "lightningcss-linux-arm64-musl": "1.29.2",[m
[31m-        "lightningcss-linux-x64-gnu": "1.29.2",[m
[31m-        "lightningcss-linux-x64-musl": "1.29.2",[m
[31m-        "lightningcss-win32-arm64-msvc": "1.29.2",[m
[31m-        "lightningcss-win32-x64-msvc": "1.29.2"[m
[32m+[m[32m        "lightningcss-darwin-arm64": "1.30.1",[m
[32m+[m[32m        "lightningcss-darwin-x64": "1.30.1",[m
[32m+[m[32m        "lightningcss-freebsd-x64": "1.30.1",[m
[32m+[m[32m        "lightningcss-linux-arm-gnueabihf": "1.30.1",[m
[32m+[m[32m        "lightningcss-linux-arm64-gnu": "1.30.1",[m
[32m+[m[32m        "lightningcss-linux-arm64-musl": "1.30.1",[m
[32m+[m[32m        "lightningcss-linux-x64-gnu": "1.30.1",[m
[32m+[m[32m        "lightningcss-linux-x64-musl": "1.30.1",[m
[32m+[m[32m        "lightningcss-win32-arm64-msvc": "1.30.1",[m
[32m+[m[32m        "lightningcss-win32-x64-msvc": "1.30.1"[m
       }[m
     },[m
     "node_modules/lightningcss-darwin-arm64": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-darwin-arm64/-/lightningcss-darwin-arm64-1.29.2.tgz",[m
[31m-      "integrity": "sha512-cK/eMabSViKn/PG8U/a7aCorpeKLMlK0bQeNHmdb7qUnBkNPnL+oV5DjJUo0kqWsJUapZsM4jCfYItbqBDvlcA==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-darwin-arm64/-/lightningcss-darwin-arm64-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-c8JK7hyE65X1MHMN+Viq9n11RRC7hgin3HhYKhrMyaXflk5GVplZ60IxyoVtzILeKr+xAJwg6zK6sjTBJ0FKYQ==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -991,9 +2126,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-darwin-x64": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-darwin-x64/-/lightningcss-darwin-x64-1.29.2.tgz",[m
[31m-      "integrity": "sha512-j5qYxamyQw4kDXX5hnnCKMf3mLlHvG44f24Qyi2965/Ycz829MYqjrVg2H8BidybHBp9kom4D7DR5VqCKDXS0w==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-darwin-x64/-/lightningcss-darwin-x64-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-k1EvjakfumAQoTfcXUcHQZhSpLlkAuEkdMBsI/ivWw9hL+7FtilQc0Cy3hrx0AAQrVtQAbMI7YjCgYgvn37PzA==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -1011,9 +2146,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-freebsd-x64": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-freebsd-x64/-/lightningcss-freebsd-x64-1.29.2.tgz",[m
[31m-      "integrity": "sha512-wDk7M2tM78Ii8ek9YjnY8MjV5f5JN2qNVO+/0BAGZRvXKtQrBC4/cn4ssQIpKIPP44YXw6gFdpUF+Ps+RGsCwg==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-freebsd-x64/-/lightningcss-freebsd-x64-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-kmW6UGCGg2PcyUE59K5r0kWfKPAVy4SltVeut+umLCFoJ53RdCUWxcRDzO1eTaxf/7Q2H7LTquFHPL5R+Gjyig==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -1031,9 +2166,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-linux-arm-gnueabihf": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-linux-arm-gnueabihf/-/lightningcss-linux-arm-gnueabihf-1.29.2.tgz",[m
[31m-      "integrity": "sha512-IRUrOrAF2Z+KExdExe3Rz7NSTuuJ2HvCGlMKoquK5pjvo2JY4Rybr+NrKnq0U0hZnx5AnGsuFHjGnNT14w26sg==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-linux-arm-gnueabihf/-/lightningcss-linux-arm-gnueabihf-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-MjxUShl1v8pit+6D/zSPq9S9dQ2NPFSQwGvxBCYaBYLPlCWuPh9/t1MRS8iUaR8i+a6w7aps+B4N0S1TYP/R+Q==",[m
       "cpu": [[m
         "arm"[m
       ],[m
[36m@@ -1051,9 +2186,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-linux-arm64-gnu": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-linux-arm64-gnu/-/lightningcss-linux-arm64-gnu-1.29.2.tgz",[m
[31m-      "integrity": "sha512-KKCpOlmhdjvUTX/mBuaKemp0oeDIBBLFiU5Fnqxh1/DZ4JPZi4evEH7TKoSBFOSOV3J7iEmmBaw/8dpiUvRKlQ==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-linux-arm64-gnu/-/lightningcss-linux-arm64-gnu-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-gB72maP8rmrKsnKYy8XUuXi/4OctJiuQjcuqWNlJQ6jZiWqtPvqFziskH3hnajfvKB27ynbVCucKSm2rkQp4Bw==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -1071,9 +2206,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-linux-arm64-musl": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-linux-arm64-musl/-/lightningcss-linux-arm64-musl-1.29.2.tgz",[m
[31m-      "integrity": "sha512-Q64eM1bPlOOUgxFmoPUefqzY1yV3ctFPE6d/Vt7WzLW4rKTv7MyYNky+FWxRpLkNASTnKQUaiMJ87zNODIrrKQ==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-linux-arm64-musl/-/lightningcss-linux-arm64-musl-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-jmUQVx4331m6LIX+0wUhBbmMX7TCfjF5FoOH6SD1CttzuYlGNVpA7QnrmLxrsub43ClTINfGSYyHe2HWeLl5CQ==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -1091,9 +2226,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-linux-x64-gnu": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-linux-x64-gnu/-/lightningcss-linux-x64-gnu-1.29.2.tgz",[m
[31m-      "integrity": "sha512-0v6idDCPG6epLXtBH/RPkHvYx74CVziHo6TMYga8O2EiQApnUPZsbR9nFNrg2cgBzk1AYqEd95TlrsL7nYABQg==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-linux-x64-gnu/-/lightningcss-linux-x64-gnu-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-piWx3z4wN8J8z3+O5kO74+yr6ze/dKmPnI7vLqfSqI8bccaTGY5xiSGVIJBDd5K5BHlvVLpUB3S2YCfelyJ1bw==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -1111,9 +2246,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-linux-x64-musl": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-linux-x64-musl/-/lightningcss-linux-x64-musl-1.29.2.tgz",[m
[31m-      "integrity": "sha512-rMpz2yawkgGT8RULc5S4WiZopVMOFWjiItBT7aSfDX4NQav6M44rhn5hjtkKzB+wMTRlLLqxkeYEtQ3dd9696w==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-linux-x64-musl/-/lightningcss-linux-x64-musl-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-rRomAK7eIkL+tHY0YPxbc5Dra2gXlI63HL+v1Pdi1a3sC+tJTcFrHX+E86sulgAXeI7rSzDYhPSeHHjqFhqfeQ==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -1131,9 +2266,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-win32-arm64-msvc": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-win32-arm64-msvc/-/lightningcss-win32-arm64-msvc-1.29.2.tgz",[m
[31m-      "integrity": "sha512-nL7zRW6evGQqYVu/bKGK+zShyz8OVzsCotFgc7judbt6wnB2KbiKKJwBE4SGoDBQ1O94RjW4asrCjQL4i8Fhbw==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-win32-arm64-msvc/-/lightningcss-win32-arm64-msvc-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-mSL4rqPi4iXq5YVqzSsJgMVFENoa4nGTT/GjO2c0Yl9OuQfPsIfncvLrEW6RbbB24WtZ3xP/2CCmI3tNkNV4oA==",[m
       "cpu": [[m
         "arm64"[m
       ],[m
[36m@@ -1151,9 +2286,9 @@[m
       }[m
     },[m
     "node_modules/lightningcss-win32-x64-msvc": {[m
[31m-      "version": "1.29.2",[m
[31m-      "resolved": "https://registry.npmjs.org/lightningcss-win32-x64-msvc/-/lightningcss-win32-x64-msvc-1.29.2.tgz",[m
[31m-      "integrity": "sha512-EdIUW3B2vLuHmv7urfzMI/h2fmlnOQBk1xlsDxkN1tCWKjNFjfLhGxYk8C8mzpSfr+A6jFFIi8fU6LbQGsRWjA==",[m
[32m+[m[32m      "version": "1.30.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lightningcss-win32-x64-msvc/-/lightningcss-win32-x64-msvc-1.30.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-PVqXh48wh4T53F/1CCu8PIPCxLzWyCnn/9T5W1Jpmdy5h9Cwd+0YQS6/LwhHXSafuc61/xg9Lv5OrCby6a++jg==",[m
       "cpu": [[m
         "x64"[m
       ],[m
[36m@@ -1170,6 +2305,95 @@[m
         "url": "https://opencollective.com/parcel"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/lodash-es": {[m
[32m+[m[32m      "version": "4.17.21",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash-es/-/lodash-es-4.17.21.tgz",[m
[32m+[m[32m      "integrity": "sha512-mKnC+QJ9pWVzv+C4/U3rRsHapFfHvQFoFB92e52xeyGMcX6/OlIl78je1u8vePzYZSkkogMPJ2yjxxsb89cxyw=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lodash.clonedeep": {[m
[32m+[m[32m      "version": "4.5.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash.clonedeep/-/lodash.clonedeep-4.5.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-H5ZhCF25riFd9uB5UCkVKo61m3S/xZk1x4wA6yp/L3RFP6Z/eHH1ymQcGLo7J3GMPfm0V/7m1tryHuGVxpqEBQ=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lodash.isequal": {[m
[32m+[m[32m      "version": "4.5.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash.isequal/-/lodash.isequal-4.5.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-pDo3lu8Jhfjqls6GkMgpahsF9kCyayhgykjyLMNFTKWrpVdAQtYyB4muAMWozBB4ig/dtWAmsMxLEI8wuz+DYQ==",[m
[32m+[m[32m      "deprecated": "This package is deprecated. Use require('node:util').isDeepStrictEqual instead."[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/loose-envify": {[m
[32m+[m[32m      "version": "1.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/loose-envify/-/loose-envify-1.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-lyuxPGr/Wfhrlem2CL/UcnUc1zcqKAImBDzukY7Y5F/yQiNdko6+fRLevlw1HgMySw7f611UIY408EtxRSoK3Q==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "js-tokens": "^3.0.0 || ^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "loose-envify": "cli.js"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lru-cache": {[m
[32m+[m[32m      "version": "6.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Jo6dJ04CmSjuznwJSS3pUeWmd/H0ffTlkXXgwZi+eq1UCmqQwCh+eLsYOYCwY991i2Fah4h1BEMCx4qThGbsiA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "yallist": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/magic-string": {[m
[32m+[m[32m      "version": "0.30.17",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/magic-string/-/magic-string-0.30.17.tgz",[m
[32m+[m[32m      "integrity": "sha512-sNPKHvyjVf7gyjwS4xGTaW/mCnF8wnjtifKBEhxfZ7E/S8tQ0rssrwGNn6q8JH/ohItJfSQp9mBtQYuTlH5QnA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@jridgewell/sourcemap-codec": "^1.5.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/minipass": {[m
[32m+[m[32m      "version": "7.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/minipass/-/minipass-7.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-qOOzS1cBTWYF4BH8fVePDBOO9iptMnGUEZwNc/cMWnTV2nVLZ7VoNWEPHkYczZA0pdoA7dl6e7FL659nX9S2aw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=16 || 14 >=14.17"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/minizlib": {[m
[32m+[m[32m      "version": "3.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/minizlib/-/minizlib-3.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-oG62iEk+CYt5Xj2YqI5Xi9xWUeZhDI8jjQmC5oThVH5JGCTgIjr7ciJDzC7MBzYd//WvR1OTmP5Q38Q8ShQtVA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "minipass": "^7.1.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/mkdirp": {[m
[32m+[m[32m      "version": "3.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/mkdirp/-/mkdirp-3.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-+NsyUUAZDmo6YVHzL/stxSu3t9YS1iljliy3BSDrXJ/dkn1KYdmtZODGGjLcc9XLgVVpH4KshHB8XmZgMhaBXg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "mkdirp": "dist/cjs/src/bin.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/isaacs"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ms": {[m
[32m+[m[32m      "version": "2.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==",[m
[32m+[m[32m      "devOptional": true[m
[32m+[m[32m    },[m
     "node_modules/nanoid": {[m
       "version": "3.3.11",[m
       "resolved": "https://registry.npmjs.org/nanoid/-/nanoid-3.3.11.tgz",[m
[36m@@ -1240,6 +2464,53 @@[m
         }[m
       }[m
     },[m
[32m+[m[32m    "node_modules/next-auth": {[m
[32m+[m[32m      "version": "4.24.11",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/next-auth/-/next-auth-4.24.11.tgz",[m
[32m+[m[32m      "integrity": "sha512-pCFXzIDQX7xmHFs4KVH4luCjaCbuPRtZ9oBUjUhOk84mZ9WVPf94n87TxYI4rSRf9HmfHEF8Yep3JrYDVOo3Cw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.20.13",[m
[32m+[m[32m        "@panva/hkdf": "^1.0.2",[m
[32m+[m[32m        "cookie": "^0.7.0",[m
[32m+[m[32m        "jose": "^4.15.5",[m
[32m+[m[32m        "oauth": "^0.9.15",[m
[32m+[m[32m        "openid-client": "^5.4.0",[m
[32m+[m[32m        "preact": "^10.6.3",[m
[32m+[m[32m        "preact-render-to-string": "^5.1.19",[m
[32m+[m[32m        "uuid": "^8.3.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@auth/core": "0.34.2",[m
[32m+[m[32m        "next": "^12.2.5 || ^13 || ^14 || ^15",[m
[32m+[m[32m        "nodemailer": "^6.6.5",[m
[32m+[m[32m        "react": "^17.0.2 || ^18 || ^19",[m
[32m+[m[32m        "react-dom": "^17.0.2 || ^18 || ^19"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "@auth/core": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        },[m
[32m+[m[32m        "nodemailer": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/next-auth/node_modules/cookie": {[m
[32m+[m[32m      "version": "0.7.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.7.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-yki5XnKuf750l50uGTllt6kKILY4nQ1eNIQatoXEByZ5dWgnKqbnqmTrBE5B4N7lrMJKQ2ytWMiTO2o0v6Ew/w==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/next-auth/node_modules/jose": {[m
[32m+[m[32m      "version": "4.15.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/jose/-/jose-4.15.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-1vUQX+IdDMVPj4k8kOxgUqlcK518yluMuGZwqlr44FS1ppZB/5GWh4rZG89erpOBOJjU/OBsnCVFfapsRz6nEA==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/next/node_modules/postcss": {[m
       "version": "8.4.31",[m
       "resolved": "https://registry.npmjs.org/postcss/-/postcss-8.4.31.tgz",[m
[36m@@ -1267,6 +2538,143 @@[m
         "node": "^10 || ^12 || >=14"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/node-releases": {[m
[32m+[m[32m      "version": "2.0.19",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/node-releases/-/node-releases-2.0.19.tgz",[m
[32m+[m[32m      "integrity": "sha512-xxOWJsBKtzAq7DY0J+DTzuz58K8e7sJbdgwkbMWQe8UYB6ekmsQ45q0M/tJDsGaZmbC+l7n57UV8Hl5tHxO9uw==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/normalize-range": {[m
[32m+[m[32m      "version": "0.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/normalize-range/-/normalize-range-0.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-bdok/XvKII3nUpklnV6P2hxtMNrCboOjAcyBuQnWEhO665FwrSNRxU+AqpsyvO6LgGYPspN+lu5CLtw4jPRKNA==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/nth-check": {[m
[32m+[m[32m      "version": "2.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/nth-check/-/nth-check-2.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-lqjrjmaOoAnWfMmBPL+XNnynZh2+swxiX3WUE0s4yEHI6m+AwrK2UZOimIRl3X/4QctVqS8AiZjFqyOGrMXb/w==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "boolbase": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/fb55/nth-check?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/oauth": {[m
[32m+[m[32m      "version": "0.9.15",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/oauth/-/oauth-0.9.15.tgz",[m
[32m+[m[32m      "integrity": "sha512-a5ERWK1kh38ExDEfoO6qUHJb32rd7aYmPHuyCu3Fta/cnICvYmgd2uhuKXvPD+PXB+gCEYYEaQdIRAjCOwAKNA=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/oauth4webapi": {[m
[32m+[m[32m      "version": "2.17.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/oauth4webapi/-/oauth4webapi-2.17.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-lbC0Z7uzAFNFyzEYRIC+pkSVvDHJTbEW+dYlSBAlCYDe6RxUkJ26bClhk8ocBZip1wfI9uKTe0fm4Ib4RHn6uQ==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true,[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object-assign": {[m
[32m+[m[32m      "version": "4.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-rJgTQnkUnH1sFw8yT6VSU3zD3sWmu6sZhIseY8VX+GRu3P6F7Fu+JNDoXfklElbLJSnc3FUQHVe4cU5hj+BcUg==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object-hash": {[m
[32m+[m[32m      "version": "2.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object-hash/-/object-hash-2.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-gScRMn0bS5fH+IuwyIFgnh9zBdo4DV+6GhygmWM9HyNJSgS0hScp1f5vjtm7oIIOiT9trXrShAkLFSc2IqKNgw==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/oidc-token-hash": {[m
[32m+[m[32m      "version": "5.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/oidc-token-hash/-/oidc-token-hash-5.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-y0W+X7Ppo7oZX6eovsRkuzcSM40Bicg2JEJkDJ4irIt1wsYAP5MLSNv+QAogO8xivMffw/9OvV3um1pxXgt1uA==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": "^10.13.0 || >=12.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/openid-client": {[m
[32m+[m[32m      "version": "5.7.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/openid-client/-/openid-client-5.7.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-jDBPgSVfTnkIh71Hg9pRvtJc6wTwqjRkN88+gCFtYWrlP4Yx2Dsrow8uPi3qLr/aeymPF3o2+dS+wOpglK04ew==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "jose": "^4.15.9",[m
[32m+[m[32m        "lru-cache": "^6.0.0",[m
[32m+[m[32m        "object-hash": "^2.2.0",[m
[32m+[m[32m        "oidc-token-hash": "^5.0.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/openid-client/node_modules/jose": {[m
[32m+[m[32m      "version": "4.15.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/jose/-/jose-4.15.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-1vUQX+IdDMVPj4k8kOxgUqlcK518yluMuGZwqlr44FS1ppZB/5GWh4rZG89erpOBOJjU/OBsnCVFfapsRz6nEA==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/panva"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parchment": {[m
[32m+[m[32m      "version": "3.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parchment/-/parchment-3.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-HUrJFQ/StvgmXRcQ1ftY6VEZUq3jA2t9ncFN4F84J/vN0/FPpQF+8FKXb3l6fLces6q0uOHj6NJn+2xvZnxO6A=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parse5": {[m
[32m+[m[32m      "version": "7.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parse5/-/parse5-7.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-IInvU7fabl34qmi9gY8XOVxhYyMyuH2xUNpb2q8/Y+7552KlejkRvqvD19nMoUW/uQGGbqNpA6Tufu5FL5BZgw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "entities": "^6.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/inikulin/parse5?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parse5-htmlparser2-tree-adapter": {[m
[32m+[m[32m      "version": "7.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parse5-htmlparser2-tree-adapter/-/parse5-htmlparser2-tree-adapter-7.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ruw5xyKs6lrpo9x9rCZqZZnIUntICjQAd0Wsmp396Ul9lN/h+ifgVV1x1gZHi8euej6wTfpqX8j+BFQxF0NS/g==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "domhandler": "^5.0.3",[m
[32m+[m[32m        "parse5": "^7.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/inikulin/parse5?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parse5-parser-stream": {[m
[32m+[m[32m      "version": "7.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parse5-parser-stream/-/parse5-parser-stream-7.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-JyeQc9iwFLn5TbvvqACIF/VXG6abODeB3Fwmv/TGdLk2LfbWkaySGY72at4+Ty7EkPZj854u4CrICqNk2qIbow==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "parse5": "^7.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/inikulin/parse5?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parse5/node_modules/entities": {[m
[32m+[m[32m      "version": "6.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/entities/-/entities-6.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-aN97NXWF6AWBTahfVOIrB/NShkzi5H7F9r1s9mD3cDj4Ko5f2qhhVoYMibXF7GlLveb/D2ioWay8lxI97Ven3g==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.12"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/fb55/entities?sponsor=1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/picocolors": {[m
       "version": "1.1.1",[m
       "resolved": "https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz",[m
[36m@@ -1300,6 +2708,124 @@[m
         "node": "^10 || ^12 || >=14"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/postcss-value-parser": {[m
[32m+[m[32m      "version": "4.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-1NNCs6uurfkVbeXG4S8JFT9t19m45ICnif8zWLd5oPSZ50QnwMfK+H3jv408d4jw/7Bttv5axS5IiHoLaVNHeQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/preact": {[m
[32m+[m[32m      "version": "10.24.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/preact/-/preact-10.24.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-Z2dPnBnMUfyQfSQ+GBdsGa16hz35YmLmtTLhM169uW944hYL6xzTYkJjC07j+Wosz733pMWx0fgON3JNw1jJQA==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/preact"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/preact-render-to-string": {[m
[32m+[m[32m      "version": "5.2.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/preact-render-to-string/-/preact-render-to-string-5.2.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-aPDxUn5o3GhWdtJtW0svRC2SS/l8D9MAgo2+AWml+BhDImb27ALf04Q2d+AHqUUOc6RdSXFIBVa2gxzgMKgtZA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "pretty-format": "^3.8.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "preact": ">=10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/pretty-format": {[m
[32m+[m[32m      "version": "3.8.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/pretty-format/-/pretty-format-3.8.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-WuxUnVtlWL1OfZFQFuqvnvs6MiAGk9UNsBostyBOB0Is9wb5uRESevA6rnl/rkksXaGX3GzZhPup5d6Vp1nFew=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/primereact": {[m
[32m+[m[32m      "version": "10.9.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/primereact/-/primereact-10.9.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-4O6gm0LrKF7Ml8zQmb8mGiWS/ugJ94KBOAS/CAxWFQh9qyNgfNw/qcpCeomPIkjWd98jrM2XDiEbgq+W0395Hw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/react-transition-group": "^4.4.1",[m
[32m+[m[32m        "react-transition-group": "^4.4.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=14.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "@types/react": "^17.0.0 || ^18.0.0 || ^19.0.0",[m
[32m+[m[32m        "react": "^17.0.0 || ^18.0.0 || ^19.0.0",[m
[32m+[m[32m        "react-dom": "^17.0.0 || ^18.0.0 || ^19.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "@types/react": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/prisma": {[m
[32m+[m[32m      "version": "6.7.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/prisma/-/prisma-6.7.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-vArg+4UqnQ13CVhc2WUosemwh6hr6cr6FY2uzDvCIFwH8pu8BXVv38PktoMLVjtX7sbYThxbnZF5YiR8sN2clw==",[m
[32m+[m[32m      "devOptional": true,[m
[32m+[m[32m      "hasInstallScript": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@prisma/config": "6.7.0",[m
[32m+[m[32m        "@prisma/engines": "6.7.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "prisma": "build/index.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18.18"[m
[32m+[m[32m      },[m
[32m+[m[32m      "optionalDependencies": {[m
[32m+[m[32m        "fsevents": "2.3.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "typescript": ">=5.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "typescript": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/prop-types": {[m
[32m+[m[32m      "version": "15.8.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/prop-types/-/prop-types-15.8.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-oj87CgZICdulUohogVAR7AjlC0327U4el4L6eAvOqCeudMDVU0NThNaV+b9Df4dXgSP1gXMTnPdhfe/2qDH5cg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "loose-envify": "^1.4.0",[m
[32m+[m[32m        "object-assign": "^4.1.1",[m
[32m+[m[32m        "react-is": "^16.13.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/quill": {[m
[32m+[m[32m      "version": "2.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/quill/-/quill-2.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-xEYQBqfYx/sfb33VJiKnSJp8ehloavImQ2A6564GAbqG55PGw1dAWUn1MUbQB62t0azawUS2CZZhWCjO8gRvTw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "eventemitter3": "^5.0.1",[m
[32m+[m[32m        "lodash-es": "^4.17.21",[m
[32m+[m[32m        "parchment": "^3.0.0",[m
[32m+[m[32m        "quill-delta": "^5.1.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "npm": ">=8.2.3"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/quill-delta": {[m
[32m+[m[32m      "version": "5.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/quill-delta/-/quill-delta-5.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-X74oCeRI4/p0ucjb5Ma8adTXd9Scumz367kkMK5V/IatcX6A0vlgLgKbzXWy5nZmCGeNJm2oQX0d2Eqj+ZIlCA==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "fast-diff": "^1.3.0",[m
[32m+[m[32m        "lodash.clonedeep": "^4.5.0",[m
[32m+[m[32m        "lodash.isequal": "^4.5.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 12.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/react": {[m
       "version": "19.1.0",[m
       "resolved": "https://registry.npmjs.org/react/-/react-19.1.0.tgz",[m
[36m@@ -1319,6 +2845,31 @@[m
         "react": "^19.1.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/react-is": {[m
[32m+[m[32m      "version": "16.13.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react-is/-/react-is-16.13.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-24e6ynE2H+OKt4kqsOvNd8kBpV65zoxbA4BVsEOB3ARVWQki/DHzaUoC5KuON/BiccDaCCTZBuOcfZs70kR8bQ=="[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/react-transition-group": {[m
[32m+[m[32m      "version": "4.4.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/react-transition-group/-/react-transition-group-4.4.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-pZcd1MCJoiKiBR2NRxeCRg13uCXbydPnmB4EOeRrY7480qNWO8IIgQG6zlDkm6uRMsURXPuKq0GWtiM59a5Q6g==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@babel/runtime": "^7.5.5",[m
[32m+[m[32m        "dom-helpers": "^5.0.1",[m
[32m+[m[32m        "loose-envify": "^1.4.0",[m
[32m+[m[32m        "prop-types": "^15.6.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "react": ">=16.6.0",[m
[32m+[m[32m        "react-dom": ">=16.6.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/safer-buffer": {[m
[32m+[m[32m      "version": "2.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg=="[m
[32m+[m[32m    },[m
     "node_modules/scheduler": {[m
       "version": "0.26.0",[m
       "resolved": "https://registry.npmjs.org/scheduler/-/scheduler-0.26.0.tgz",[m
[36m@@ -1424,20 +2975,46 @@[m
       }[m
     },[m
     "node_modules/tailwindcss": {[m
[31m-      "version": "4.1.4",[m
[31m-      "resolved": "https://registry.npmjs.org/tailwindcss/-/tailwindcss-4.1.4.tgz",[m
[31m-      "integrity": "sha512-1ZIUqtPITFbv/DxRmDr5/agPqJwF69d24m9qmM1939TJehgY539CtzeZRjbLt5G6fSy/7YqqYsfvoTEw9xUI2A==",[m
[32m+[m[32m      "version": "4.1.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/tailwindcss/-/tailwindcss-4.1.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-kr1o/ErIdNhTz8uzAYL7TpaUuzKIE6QPQ4qmSdxnoX/lo+5wmUHQA6h3L5yIqEImSRnAAURDirLu/BgiXGPAhg==",[m
       "dev": true[m
     },[m
     "node_modules/tapable": {[m
[31m-      "version": "2.2.1",[m
[31m-      "resolved": "https://registry.npmjs.org/tapable/-/tapable-2.2.1.tgz",[m
[31m-      "integrity": "sha512-GNzQvQTOIP6RyTfE2Qxb8ZVlNmw0n88vp1szwWRimP02mnTsx3Wtn5qRdqY9w2XduFNUgvOwhNnQsjwCp+kqaQ==",[m
[32m+[m[32m      "version": "2.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/tapable/-/tapable-2.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-Re10+NauLTMCudc7T5WLFLAwDhQ0JWdrMK+9B2M8zR5hRExKmsRDCBA7/aV/pNJFltmBFO5BAMlQFi/vq3nKOg==",[m
       "dev": true,[m
       "engines": {[m
         "node": ">=6"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/tar": {[m
[32m+[m[32m      "version": "7.4.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/tar/-/tar-7.4.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-5S7Va8hKfV7W5U6g3aYxXmlPoZVAwUMy9AOKyF2fVuZa2UD3qZjg578OrLRt8PcNN1PleVaL/5/yYATNL0ICUw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@isaacs/fs-minipass": "^4.0.0",[m
[32m+[m[32m        "chownr": "^3.0.0",[m
[32m+[m[32m        "minipass": "^7.1.2",[m
[32m+[m[32m        "minizlib": "^3.0.1",[m
[32m+[m[32m        "mkdirp": "^3.0.1",[m
[32m+[m[32m        "yallist": "^5.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/tar/node_modules/yallist": {[m
[32m+[m[32m      "version": "5.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/yallist/-/yallist-5.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-YgvUTfwqyc7UXVMrB+SImsVYSmTS8X/tSrtdNZMImM+n7+QTriRXyXim0mBrTXNeqzVF0KWGgHPeiyViFFrNDw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/tslib": {[m
       "version": "2.8.1",[m
       "resolved": "https://registry.npmjs.org/tslib/-/tslib-2.8.1.tgz",[m
[36m@@ -1447,7 +3024,7 @@[m
       "version": "5.8.3",[m
       "resolved": "https://registry.npmjs.org/typescript/-/typescript-5.8.3.tgz",[m
       "integrity": "sha512-p1diW6TqL9L07nNxvRMM7hMMw4c5XOo/1ibL4aAIGmSAt9slTE1Xgw5KWuof2uTOvCg9BY7ZRi+GaF+7sfgPeQ==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "bin": {[m
         "tsc": "bin/tsc",[m
         "tsserver": "bin/tsserver"[m
[36m@@ -1456,11 +3033,81 @@[m
         "node": ">=14.17"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/undici": {[m
[32m+[m[32m      "version": "7.11.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/undici/-/undici-7.11.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-heTSIac3iLhsmZhUCjyS3JQEkZELateufzZuBaVM5RHXdSBMb1LPMQf5x+FH7qjsZYDP0ttAc3nnVpUB+wYbOg==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=20.18.1"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/undici-types": {[m
       "version": "6.19.8",[m
       "resolved": "https://registry.npmjs.org/undici-types/-/undici-types-6.19.8.tgz",[m
       "integrity": "sha512-ve2KP6f/JnbPBFyobGHuerC9g1FYGn/F8n1LWTwNxCEzd6IfqTwUQcNXgEtmmQ6DlRrC1hrSrBnCZPokRrDHjw==",[m
       "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/update-browserslist-db": {[m
[32m+[m[32m      "version": "1.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-UxhIZQ+QInVdunkDAaiazvvT/+fXL5Osr0JZlJulepYu6Jd7qJtDZjlur0emRlT71EN3ScPoE7gvsuIKKNavKw==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "opencollective",[m
[32m+[m[32m          "url": "https://opencollective.com/browserslist"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "tidelift",[m
[32m+[m[32m          "url": "https://tidelift.com/funding/github/npm/browserslist"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/ai"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "escalade": "^3.2.0",[m
[32m+[m[32m        "picocolors": "^1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "update-browserslist-db": "cli.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "browserslist": ">= 4.21.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/uuid": {[m
[32m+[m[32m      "version": "8.3.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/uuid/-/uuid-8.3.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-+NYs2QeMWy+GWFOEm9xnn6HCDp0l7QBD7ml8zLUmJ+93Q5NF0NocErnwkTkXVFNiX3/fpC6afS8Dhb/gz7R7eg==",[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "uuid": "dist/bin/uuid"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/whatwg-encoding": {[m
[32m+[m[32m      "version": "3.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/whatwg-encoding/-/whatwg-encoding-3.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-6qN4hJdMwfYBtE3YBTTHhoeuUrDBPZmbQaxWAqSALV/MeEnR5z1xd8UKud2RAkFoPkmB+hli1TZSnyi84xz1vQ==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "iconv-lite": "0.6.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/whatwg-mimetype": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/whatwg-mimetype/-/whatwg-mimetype-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-QaKxh0eNIi2mE9p2vEdzfagOKHCcj1pJ56EEHGQOVxp8r9/iszLUUV7v89x9O1p/T+NlTM5W7jW6+cz4Fq1YVg==",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=18"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/yallist": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-3wdGidZyq5PB084XLES5TpOSRA3wjXAlIWMhum2kRcv/41Sn2emQ0dycQW4uZXLejwKvg6EsvbdlVL+FYEct7A=="[m
     }[m
   }[m
 }[m
[1mdiff --git a/package.json b/package.json[m
[1mindex 6383d50..061c21a 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -9,16 +9,26 @@[m
     "lint": "next lint"[m
   },[m
   "dependencies": {[m
[32m+[m[32m    "@auth/prisma-adapter": "^2.9.1",[m
[32m+[m[32m    "@prisma/client": "^6.8.2",[m
[32m+[m[32m    "cheerio": "^1.1.0",[m
[32m+[m[32m    "coloring-console": "^1.0.22",[m
[32m+[m[32m    "next": "15.3.1",[m
[32m+[m[32m    "next-auth": "^4.24.11",[m
[32m+[m[32m    "primereact": "^10.9.5",[m
[32m+[m[32m    "quill": "^2.0.3",[m
     "react": "^19.0.0",[m
[31m-    "react-dom": "^19.0.0",[m
[31m-    "next": "15.3.1"[m
[32m+[m[32m    "react-dom": "^19.0.0"[m
   },[m
   "devDependencies": {[m
[31m-    "typescript": "^5",[m
[32m+[m[32m    "@tailwindcss/postcss": "^4.1.7",[m
[32m+[m[32m    "@types/next-auth": "^3.15.0",[m
     "@types/node": "^20",[m
     "@types/react": "^19",[m
     "@types/react-dom": "^19",[m
[31m-    "@tailwindcss/postcss": "^4",[m
[31m-    "tailwindcss": "^4"[m
[32m+[m[32m    "autoprefixer": "^10.4.21",[m
[32m+[m[32m    "prisma": "^6.7.0",[m
[32m+[m[32m    "tailwindcss": "^4",[m
[32m+[m[32m    "typescript": "^5"[m
   }[m
 }[m
[1mdiff --git a/postcss.config.mjs b/postcss.config.mjs[m
[1mindex c7bcb4b..af9d8dc 100644[m
[1m--- a/postcss.config.mjs[m
[1m+++ b/postcss.config.mjs[m
[36m@@ -1,5 +1,6 @@[m
[31m-const config = {[m
[31m-  plugins: ["@tailwindcss/postcss"],[m
[31m-};[m
[31m-[m
[31m-export default config;[m
[32m+[m[32mexport default {[m
[32m+[m[32m  plugins: {[m
[32m+[m[32m    '@tailwindcss/postcss': {},[m
[32m+[m[32m    autoprefixer: {},[m
[32m+[m[32m  },[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/prisma/schema.prisma b/prisma/schema.prisma[m
[1mnew file mode 100644[m
[1mindex 0000000..2fdb956[m
[1m--- /dev/null[m
[1m+++ b/prisma/schema.prisma[m
[36m@@ -0,0 +1,108 @@[m
[32m+[m
[32m+[m[32mgenerator client {[m
[32m+[m[32m  provider = "prisma-client-js"[m
[32m+[m[32m  output   = "../src/generated/prisma"[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mdatasource db {[m
[32m+[m[32m  provider = "mongodb"[m
[32m+[m[32m  url      = env("DATABASE_URL")[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mmodel Account {[m
[32m+[m[32m  id                String  @id @default(auto()) @map("_id") @db.ObjectId[m
[32m+[m[32m  userId            String  @db.ObjectId[m
[32m+[m[32m  type              String[m
[32m+[m[32m  provider          String[m
[32m+[m[32m  providerAccountId String[m
[32m+[m[32m  refresh_token     String? @db.String[m
[32m+[m[32m  access_token      String? @db.String[m
[32m+[m[32m  expires_at        Int?[m
[32m+[m[32m  token_type        String?[m
[32m+[m[32m  scope             String?[m
[32m+[m[32m  id_token          String? @db.String[m
[32m+[m[32m  session_state     String?[m
[32m+[m[41m [m
[32m+[m[32m  createdAt DateTime @default(now())[m
[32m+[m[32m  updatedAt DateTime @updatedAt[m
[32m+[m[41m [m
[32m+[m[32m  user User @relation(fields: [userId], references: [id], onDelete: Cascade)[m
[32m+[m[41m [m
[32m+[m[32m  @@unique([provider, providerAccountId])[m
[32m+[m[32m}[m
[32m+[m[41m [m
[32m+[m[32mmodel Session {[m
[32m+[m[32m  id           String   @id @default(auto()) @map("_id") @db.ObjectId[m
[32m+[m[32m  sessionToken String   @unique[m
[32m+[m[32m  userId       String   @db.ObjectId[m
[32m+[m[32m  expires      DateTime[m
[32m+[m[32m  user         User     @relation(fields: [userId], references: [id], onDelete: Cascade)[m
[32m+[m[41m [m
[32m+[m[32m  createdAt DateTime @default(now())[m
[32m+[m[32m  updatedAt DateTime @updatedAt[m
[32m+[m[32m}[m
[32m+[m[41m [m
[32m+[m[32mmodel VerificationToken {[m
[32m+[m[32m  id         String   @id @default(auto()) @map("_id") @db.ObjectId[m
[32m+[m[32m  identifier String[m
[32m+[m[32m  token      String[m
[32m+[m[32m  expires    DateTime[m
[32m+[m[41m [m
[32m+[m[32m  @@unique([identifier, token])[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mmodel PostVolei {[m
[32m+[m[32m  id        String   @id @default(auto()) @map("_id") @db.ObjectId[m
[32m+[m[32m  title     String[m
[32m+[m[32m  picture   String[m
[32m+[m[32m  description String?[m
[32m+[m[32m  content   String[m
[32m+[m[32m  published Boolean  @default(false)[m
[32m+[m[32m  author    User?    @relation(fields: [authorId], references: [id])[m
[32m+[m[32m  authorId  String?  @db.ObjectId[m
[32m+[m
[32m+[m[32m  createdAt DateTime @default(now())[m
[32m+[m[32m  updatedAt DateTime @updatedAt[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mmodel PostSoccer {[m
[32m+[m[32m  id        String   @id @default(auto()) @map("_id") @db.ObjectId[m
[32m+[m[32m  title     String[m
[32m+[m[32m  picture   String?[m
[32m+[m[32m  description String?[m
[32m+[m[32m  content   String?[m
[32m+[m[32m  published Boolean  @default(false)[m
[32m+[m[32m  author    User?    @relation(fields: [authorId], references: [id])[m
[32m+[m[32m  authorId  String?  @db.ObjectId[m
[32m+[m
[32m+[m[32m  createdAt DateTime @default(now())[m
[32m+[m[32m  updatedAt DateTime @updatedAt[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mmodel Postfutevolei {[m
[32m+[m[32m  id        String   @id @default(auto()) @map("_id") @db.ObjectId[m
[32m+[m[32m  title     String[m
[32m+[m[32m  picture   String?[m
[32m+[m[32m  description String?[m
[32m+[m[32m  content   String?[m
[32m+[m[32m  published Boolean  @default(false)[m
[32m+[m[32m  author    User?    @relation(fields: [authorId], references: [id])[m
[32m+[m[32m  authorId  String?  @db.ObjectId[m
[32m+[m
[32m+[m[32m  createdAt DateTime @default(now())[m
[32m+[m[32m  updatedAt DateTime @updatedAt[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mmodel User {[m
[32m+[m[32m  id            String          @id @default(auto()) @map("_id") @db.ObjectId[m
[32m+[m[32m  name          String?[m
[32m+[m[32m  email         String?         @unique[m
[32m+[m[32m  emailVerified DateTime?[m
[32m+[m[32m  image         String?[m
[32m+[m[32m  role          String   @default("user")[m
[32m+[m[32m  accounts      Account[][m
[32m+[m[32m  sessions      Session[][m
[32m+[m[32m  postsVolei    PostVolei[][m
[32m+[m[32m  postsSoccer   PostSoccer[][m
[32m+[m[32m  postsFutevolei Postfutevolei[][m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/public/Picsart_25-05-04_18-39-47-510.png b/public/Picsart_25-05-04_18-39-47-510.png[m
[1mnew file mode 100644[m
[1mindex 0000000..81e47b8[m
Binary files /dev/null and b/public/Picsart_25-05-04_18-39-47-510.png differ
[1mdiff --git a/public/background.jpg b/public/background.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..68dd8d0[m
Binary files /dev/null and b/public/background.jpg differ
[1mdiff --git a/public/favicon.png b/public/favicon.png[m
[1mnew file mode 100644[m
[1mindex 0000000..6995d25[m
Binary files /dev/null and b/public/favicon.png differ
[1mdiff --git a/public/file.svg b/public/file.svg[m
[1mdeleted file mode 100644[m
[1mindex 004145c..0000000[m
[1m--- a/public/file.svg[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-<svg fill="none" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path d="M14.5 13.5V5.41a1 1 0 0 0-.3-.7L9.8.29A1 1 0 0 0 9.08 0H1.5v13.5A2.5 2.5 0 0 0 4 16h8a2.5 2.5 0 0 0 2.5-2.5m-1.5 0v-7H8v-5H3v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1M9.5 5V2.12L12.38 5zM5.13 5h-.62v1.25h2.12V5zm-.62 3h7.12v1.25H4.5zm.62 3h-.62v1.25h7.12V11z" clip-rule="evenodd" fill="#666" fill-rule="evenodd"/></svg>[m
\ No newline at end of file[m
[1mdiff --git a/public/futevolei.png b/public/futevolei.png[m
[1mnew file mode 100644[m
[1mindex 0000000..badc9c6[m
Binary files /dev/null and b/public/futevolei.png differ
[1mdiff --git a/public/globe.svg b/public/globe.svg[m
[1mdeleted file mode 100644[m
[1mindex 567f17b..0000000[m
[1m--- a/public/globe.svg[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-<svg fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><g clip-path="url(#a)"><path fill-rule="evenodd" clip-rule="evenodd" d="M10.27 14.1a6.5 6.5 0 0 0 3.67-3.45q-1.24.21-2.7.34-.31 1.83-.97 3.1M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m.48-1.52a7 7 0 0 1-.96 0H7.5a4 4 0 0 1-.84-1.32q-.38-.89-.63-2.08a40 40 0 0 0 3.92 0q-.25 1.2-.63 2.08a4 4 0 0 1-.84 1.31zm2.94-4.76q1.66-.15 2.95-.43a7 7 0 0 0 0-2.58q-1.3-.27-2.95-.43a18 18 0 0 1 0 3.44m-1.27-3.54a17 17 0 0 1 0 3.64 39 39 0 0 1-4.3 0 17 17 0 0 1 0-3.64 39 39 0 0 1 4.3 0m1.1-1.17q1.45.13 2.69.34a6.5 6.5 0 0 0-3.67-3.44q.65 1.26.98 3.1M8.48 1.5l.01.02q.41.37.84 1.31.38.89.63 2.08a40 40 0 0 0-3.92 0q.25-1.2.63-2.08a4 4 0 0 1 .85-1.32 7 7 0 0 1 .96 0m-2.75.4a6.5 6.5 0 0 0-3.67 3.44 29 29 0 0 1 2.7-.34q.31-1.83.97-3.1M4.58 6.28q-1.66.16-2.95.43a7 7 0 0 0 0 2.58q1.3.27 2.95.43a18 18 0 0 1 0-3.44m.17 4.71q-1.45-.12-2.69-.34a6.5 6.5 0 0 0 3.67 3.44q-.65-1.27-.98-3.1" fill="#666"/></g><defs><clipPath id="a"><path fill="#fff" d="M0 0h16v16H0z"/></clipPath></defs></svg>[m
\ No newline at end of file[m
[1mdiff --git a/public/logo.png b/public/logo.png[m
[1mnew file mode 100644[m
[1mindex 0000000..ec42fb1[m
Binary files /dev/null and b/public/logo.png differ
[1mdiff --git a/public/logoestendida.png b/public/logoestendida.png[m
[1mnew file mode 100644[m
[1mindex 0000000..81e47b8[m
Binary files /dev/null and b/public/logoestendida.png differ
[1mdiff --git a/public/next.svg b/public/next.svg[m
[1mdeleted file mode 100644[m
[1mindex 5174b28..0000000[m
[1m--- a/public/next.svg[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 394 80"><path fill="#000" d="M262 0h68.5v12.7h-27.2v66.6h-13.6V12.7H262V0ZM149 0v12.7H94v20.4h44.3v12.6H94v21h55v12.6H80.5V0h68.7zm34.3 0h-17.8l63.8 79.4h17.9l-32-39.7 32-39.6h-17.9l-23 28.6-23-28.6zm18.3 56.7-9-11-27.1 33.7h17.8l18.3-22.7z"/><path fill="#000" d="M81 79.3 17 0H0v79.3h13.6V17l50.2 62.3H81Zm252.6-.4c-1 0-1.8-.4-2.5-1s-1.1-1.6-1.1-2.6.3-1.8 1-2.5 1.6-1 2.6-1 1.8.3 2.5 1a3.4 3.4 0 0 1 .6 4.3 3.7 3.7 0 0 1-3 1.8zm23.2-33.5h6v23.3c0 2.1-.4 4-1.3 5.5a9.1 9.1 0 0 1-3.8 3.5c-1.6.8-3.5 1.3-5.7 1.3-2 0-3.7-.4-5.3-1s-2.8-1.8-3.7-3.2c-.9-1.3-1.4-3-1.4-5h6c.1.8.3 1.6.7 2.2s1 1.2 1.6 1.5c.7.4 1.5.5 2.4.5 1 0 1.8-.2 2.4-.6a4 4 0 0 0 1.6-1.8c.3-.8.5-1.8.5-3V45.5zm30.9 9.1a4.4 4.4 0 0 0-2-3.3 7.5 7.5 0 0 0-4.3-1.1c-1.3 0-2.4.2-3.3.5-.9.4-1.6 1-2 1.6a3.5 3.5 0 0 0-.3 4c.3.5.7.9 1.3 1.2l1.8 1 2 .5 3.2.8c1.3.3 2.5.7 3.7 1.2a13 13 0 0 1 3.2 1.8 8.1 8.1 0 0 1 3 6.5c0 2-.5 3.7-1.5 5.1a10 10 0 0 1-4.4 3.5c-1.8.8-4.1 1.2-6.8 1.2-2.6 0-4.9-.4-6.8-1.2-2-.8-3.4-2-4.5-3.5a10 10 0 0 1-1.7-5.6h6a5 5 0 0 0 3.5 4.6c1 .4 2.2.6 3.4.6 1.3 0 2.5-.2 3.5-.6 1-.4 1.8-1 2.4-1.7a4 4 0 0 0 .8-2.4c0-.9-.2-1.6-.7-2.2a11 11 0 0 0-2.1-1.4l-3.2-1-3.8-1c-2.8-.7-5-1.7-6.6-3.2a7.2 7.2 0 0 1-2.4-5.7 8 8 0 0 1 1.7-5 10 10 0 0 1 4.3-3.5c2-.8 4-1.2 6.4-1.2 2.3 0 4.4.4 6.2 1.2 1.8.8 3.2 2 4.3 3.4 1 1.4 1.5 3 1.5 5h-5.8z"/></svg>[m
\ No newline at end of file[m
[1mdiff --git a/public/nome.png b/public/nome.png[m
[1mnew file mode 100644[m
[1mindex 0000000..282fb1a[m
Binary files /dev/null and b/public/nome.png differ
[1mdiff --git a/public/soccer.png b/public/soccer.png[m
[1mnew file mode 100644[m
[1mindex 0000000..8315193[m
Binary files /dev/null and b/public/soccer.png differ
[1mdiff --git a/public/vercel.svg b/public/vercel.svg[m
[1mdeleted file mode 100644[m
[1mindex 7705396..0000000[m
[1m--- a/public/vercel.svg[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-<svg fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1155 1000"><path d="m577.3 0 577.4 1000H0z" fill="#fff"/></svg>[m
\ No newline at end of file[m
[1mdiff --git a/public/volei.png b/public/volei.png[m
[1mnew file mode 100644[m
[1mindex 0000000..a3c8448[m
Binary files /dev/null and b/public/volei.png differ
[1mdiff --git a/public/window.svg b/public/window.svg[m
[1mdeleted file mode 100644[m
[1mindex b2b2a44..0000000[m
[1m--- a/public/window.svg[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-<svg fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill-rule="evenodd" clip-rule="evenodd" d="M1.5 2.5h13v10a1 1 0 0 1-1 1h-11a1 1 0 0 1-1-1zM0 1h16v11.5a2.5 2.5 0 0 1-2.5 2.5h-11A2.5 2.5 0 0 1 0 12.5zm3.75 4.5a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5M7 4.75a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0m1.75.75a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5" fill="#666"/></svg>[m
\ No newline at end of file[m
[1mdiff --git a/src/@types/next-auth.d.ts b/src/@types/next-auth.d.ts[m
[1mnew file mode 100644[m
[1mindex 0000000..ce3ee90[m
[1m--- /dev/null[m
[1m+++ b/src/@types/next-auth.d.ts[m
[36m@@ -0,0 +1,16 @@[m
[32m+[m[32mimport { DefaultSession } from "next-auth";[m
[32m+[m
[32m+[m[32mdeclare module "next-auth" {[m
[32m+[m[32m  interface Session {[m
[32m+[m[32m    user: {[m
[32m+[m[32m      id: string;[m
[32m+[m[32m      name?: string | null;[m
[32m+[m[32m      email?: string | null;[m
[32m+[m[32m      image?: string | null;[m
[32m+[m[32m      role?: string;[m
[32m+[m[32m    } & DefaultSession["user"];[m
[32m+[m[32m  }[m
[32m+[m[32m   interface User {[m
[32m+[m[32m    role?: string;[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/(admin)/admin/beachsoccer/beachsoccerclient.tsx b/src/app/(admin)/admin/beachsoccer/beachsoccerclient.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..4116cad[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/admin/beachsoccer/beachsoccerclient.tsx[m
[36m@@ -0,0 +1,85 @@[m
[32m+[m[32m'use client';[m
[32m+[m
[32m+[m[32mimport EditorBloco from "@/app/components/editor/editor";[m
[32m+[m[32mimport { useState } from "react";[m
[32m+[m[32mimport { Button } from 'primereact/button';[m
[32m+[m[32mimport { beachsoccerService } from "@/services";[m
[32m+[m[32mimport { useSession } from "next-auth/react";[m
[32m+[m
[32m+[m
[32m+[m[32mexport default function BeachsoccerClient() {[m
[32m+[m
[32m+[m[32m    // Obtém os dados da sessão atual do usuário logado com NextAuth[m
[32m+[m[32m    // "data" é renomeado para "session" para facilitar o uso[m
[32m+[m[32m    const { data: session } = useSession()[m[41m [m
[32m+[m
[32m+[m[32m    const [content, setContent] = useState('')[m
[32m+[m[32m    const [title, setTitle] = useState('')[m
[32m+[m[32m    const [picture, setPicture] = useState('')[m
[32m+[m
[32m+[m[32m    // Função usada para receber o conteúdo do editor e atualizar o estado 'content'[m
[32m+[m[32m    const sourceData = (data: any) => {[m
[32m+[m[32m        setContent(data)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    // Função usada para receber o título e atualizar o estado 'title'[m
[32m+[m[32m    const sourceTitle = (title: any) => {[m
[32m+[m[32m        setTitle(title)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const sourceThumbnail = (thumbnail: any) => {[m
[32m+[m[32m        setPicture(thumbnail)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    // Função assíncrona que será chamada ao clicar no botão 'Salvar'[m
[32m+[m[32m    const handleSubmit = async () => {[m
[32m+[m
[32m+[m[32m        //monta o corpo da requisição com os dados do post[m
[32m+[m[32m        const body = {[m
[32m+[m[32m            title: title,[m
[32m+[m[32m            content: content,[m
[32m+[m[32m            picture: picture,[m
[32m+[m[32m            published: false,[m
[32m+[m[32m            authorId: session?.user.id[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m        // Chama o serviço responsável por salvar o post no banco de dados[m
[32m+[m[32m        const result = await beachsoccerService(body)[m
[32m+[m
[32m+[m[32m        // Verifica se a resposta foi bem-sucedida e limpa o editor após salvo[m
[32m+[m[32m        if (result) {[m
[32m+[m[32m            setTitle('')[m
[32m+[m[32m            setContent('')[m
[32m+[m[32m            alert('Post salvo com sucesso!')[m
[32m+[m[32m            window.location.reload()[m
[32m+[m[32m        } else {[m
[32m+[m[32m            alert('Erro ao salvar o post.');[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m        <>[m
[32m+[m[32m            <main className="flex w-full items-center justify-center">[m
[32m+[m[32m                <div className="flex flex-col w-200 items-center bg-orange-300  shadow-xl pt-0 p-5 z-10">[m
[32m+[m[32m                    <EditorBloco[m
[32m+[m[32m                        content={content}[m
[32m+[m[32m                        title={title}[m
[32m+[m[32m                        picture={picture}[m
[32m+[m[32m                        sourceThumbnail={sourceThumbnail}[m
[32m+[m[32m                        sourceData={setContent}[m
[32m+[m[32m                        sourceTitle={setTitle}[m
[32m+[m[32m                    />[m
[32m+[m[32m                    <div className="flex justify-center  items-center mt-4">[m
[32m+[m[32m                        <Button[m
[32m+[m[32m                            label="Salvar"[m
[32m+[m[32m                            className="curor-point shadow-lg flex flex-col w-full justify-center items-center rounded-xl p-2 hover:bg-orange-500"[m
[32m+[m[32m                            onClick={handleSubmit}[m
[32m+[m[32m                        />[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </main>[m
[32m+[m[32m        </>[m
[32m+[m[32m    )[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/(admin)/admin/beachsoccer/page.tsx b/src/app/(admin)/admin/beachsoccer/page.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..b54e4a5[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/admin/beachsoccer/page.tsx[m
[36m@@ -0,0 +1,31 @@[m
[32m+[m[32mimport { getServerSession } from "next-auth";[m
[32m+[m[32mimport { authOptions } from "@/lib/auth";[m
[32m+[m[32mimport BeachsoccerClient from "./beachsoccerclient";[m
[32m+[m
[32m+[m[32mexport default async function FutevoleiPost() {[m
[32m+[m
[32m+[m[32m  // Obtém a sessão do usuário autenticado no lado do servidor definidas em `authOptions`[m
[32m+[m[32m  const session = await getServerSession(authOptions);[m
[32m+[m
[32m+[m[32m  //verifica se o usuário está logado ou se ele é um administrador através do role[m
[32m+[m[32m    if (!session || session.user.role !== "admin") {[m
[32m+[m[32m      return ([m
[32m+[m[32m          <main className="flex w-full h-screen items-center justify-center overflow-hidden ">[m
[32m+[m[32m          <div className="flex flex-col items-center justify-center w-xl h-screen bg-orange-300">[m
[32m+[m[32m              <h1 className="text-2xl font-bold">Acesso Negado!</h1>[m
[32m+[m[32m              <p className="text-lg">Você não tem permissão para acessar esta página.</p>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          </main>[m
[32m+[m[32m      );[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m    <main className="flex w-full min-h-screen items-center justify-center overflow-y-auto">[m
[32m+[m[32m      <div className="flex flex-col w-full max-w-4xl items-center bg-orange-300 shadow-xl p-5 z-10">[m
[32m+[m[32m        <BeachsoccerClient/>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </main>[m
[32m+[m[32m  );[m
[32m+[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/(admin)/admin/futevolei/futevoleiclient.tsx b/src/app/(admin)/admin/futevolei/futevoleiclient.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..434735c[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/admin/futevolei/futevoleiclient.tsx[m
[36m@@ -0,0 +1,85 @@[m
[32m+[m[32m'use client';[m
[32m+[m
[32m+[m[32mimport EditorBloco from "@/app/components/editor/editor";[m
[32m+[m[32mimport { useState } from "react";[m
[32m+[m[32mimport { Button } from 'primereact/button';[m
[32m+[m[32mimport { futevoleiService } from "@/services";[m
[32m+[m[32mimport { useSession } from "next-auth/react";[m
[32m+[m
[32m+[m
[32m+[m[32mexport default function FutevoleiClient() {[m
[32m+[m
[32m+[m[32m    // Obtém os dados da sessão atual do usuário logado com NextAuth[m
[32m+[m[32m    // "data" é renomeado para "session" para facilitar o uso[m
[32m+[m[32m    const { data: session } = useSession()[m[41m [m
[32m+[m
[32m+[m[32m    const [content, setContent] = useState('')[m
[32m+[m[32m    const [title, setTitle] = useState('')[m
[32m+[m[32m    const [picture, setPicture] = useState('')[m
[32m+[m
[32m+[m[32m    // Função usada para receber o conteúdo do editor e atualizar o estado 'content'[m
[32m+[m[32m    const sourceData = (data: any) => {[m
[32m+[m[32m        setContent(data)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    // Função usada para receber o título e atualizar o estado 'title'[m
[32m+[m[32m    const sourceTitle = (title: any) => {[m
[32m+[m[32m        setTitle(title)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const sourceThumbnail = (thumbnail: any) => {[m
[32m+[m[32m        setPicture(thumbnail)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    // Função assíncrona que será chamada ao clicar no botão 'Salvar'[m
[32m+[m[32m    const handleSubmit = async () => {[m
[32m+[m
[32m+[m[32m        //monta o corpo da requisição com os dados do post[m
[32m+[m[32m        const body = {[m
[32m+[m[32m            title: title,[m
[32m+[m[32m            content: content,[m
[32m+[m[32m            picture: picture,[m
[32m+[m[32m            published: false,[m
[32m+[m[32m            authorId: session?.user.id[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m        // Chama o serviço responsável por salvar o post no banco de dados[m
[32m+[m[32m        const result = await futevoleiService(body)[m
[32m+[m
[32m+[m[32m        // Verifica se a resposta foi bem-sucedida e limpa o editor após salvo[m
[32m+[m[32m        if (result) {[m
[32m+[m[32m            setTitle('')[m
[32m+[m[32m            setContent('')[m
[32m+[m[32m            alert('Post salvo com sucesso!')[m
[32m+[m[32m            window.location.reload()[m
[32m+[m[32m        } else {[m
[32m+[m[32m            alert('Erro ao salvar o post.')[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m        <>[m
[32m+[m[32m            <main className="flex w-full items-center justify-center">[m
[32m+[m[32m                <div className="flex flex-col w-200 items-center bg-orange-300  shadow-xl pt-0 p-5 z-10">[m
[32m+[m[32m                    <EditorBloco[m
[32m+[m[32m                        content={content}[m
[32m+[m[32m                        title={title}[m
[32m+[m[32m                        picture={picture}[m
[32m+[m[32m                        sourceThumbnail={setPicture}[m
[32m+[m[32m                        sourceData={setContent}[m
[32m+[m[32m                        sourceTitle={setTitle}[m
[32m+[m[32m                    />[m
[32m+[m[32m                    <div className="flex justify-center  items-center mt-4">[m
[32m+[m[32m                        <Button[m
[32m+[m[32m                            label="Salvar"[m
[32m+[m[32m                            className="curor-point shadow-lg flex flex-col w-full justify-center items-center rounded-xl p-2 hover:bg-orange-500"[m
[32m+[m[32m                            onClick={handleSubmit}[m
[32m+[m[32m                        />[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </main>[m
[32m+[m[32m        </>[m
[32m+[m[32m    )[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/(admin)/admin/futevolei/page.tsx b/src/app/(admin)/admin/futevolei/page.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..cf7bee9[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/admin/futevolei/page.tsx[m
[36m@@ -0,0 +1,31 @@[m
[32m+[m[32mimport { getServerSession } from "next-auth";[m
[32m+[m[32mimport { authOptions } from "@/lib/auth";[m
[32m+[m[32mimport FutevoleiClient from "./futevoleiclient";[m
[32m+[m
[32m+[m[32mexport default async function FutevoleiPost() {[m
[32m+[m
[32m+[m[32m  // Obtém a sessão do usuário autenticado no lado do servidor definidas em `authOptions`[m
[32m+[m[32m  const session = await getServerSession(authOptions);[m
[32m+[m
[32m+[m[32m  //verifica se o usuário está logado ou se ele é um administrador através do role[m
[32m+[m[32m    if (!session || session.user.role !== "admin") {[m
[32m+[m[32m      return ([m
[32m+[m[32m          <main className="flex w-full h-screen items-center justify-center overflow-hidden ">[m
[32m+[m[32m          <div className="flex flex-col items-center justify-center w-xl h-screen bg-orange-300">[m
[32m+[m[32m              <h1 className="text-2xl font-bold">Acesso Negado!</h1>[m
[32m+[m[32m              <p className="text-lg">Você não tem permissão para acessar esta página.</p>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          </main>[m
[32m+[m[32m      );[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m    <main className="flex w-full min-h-screen items-center justify-center overflow-y-auto">[m
[32m+[m[32m      <div className="flex flex-col w-full max-w-4xl items-center bg-orange-300 shadow-xl p-5 z-10">[m
[32m+[m[32m        <FutevoleiClient/>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </main>[m
[32m+[m[32m  );[m
[32m+[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/(admin)/admin/page.tsx b/src/app/(admin)/admin/page.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..d1f140d[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/admin/page.tsx[m
[36m@@ -0,0 +1,52 @@[m
[32m+[m[32mimport Header from "@/app/(admin)/components/header/header";[m
[32m+[m[32mimport Image from "next/image";[m
[32m+[m[32mimport Link from "next/link";[m
[32m+[m[32mimport { getServerSession } from "next-auth";[m
[32m+[m[32mimport { authOptions } from "@/lib/auth";[m
[32m+[m[32mimport { Session } from "next-auth";[m
[32m+[m
[32m+[m[32mexport default async function Admin() {[m
[32m+[m[32m    const session = await getServerSession(authOptions);[m
[32m+[m[41m    [m
[32m+[m[32m    if (!session || session.user.role !== "admin") {[m
[32m+[m[32m        return ([m
[32m+[m[32m            <main className="flex w-full h-screen items-center justify-center overflow-hidden ">[m
[32m+[m[32m            <div className="flex flex-col items-center justify-center w-xl h-screen bg-orange-300">[m
[32m+[m[32m                <h1 className="text-2xl font-bold">Acesso Negado!</h1>[m
[32m+[m[32m                <p className="text-lg">Você não tem permissão para acessar esta página.</p>[m
[32m+[m[32m            </div>[m
[32m+[m[32m            </main>[m
[32m+[m[32m        );[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m  return ([m
[32m+[m[32m    <>[m
[32m+[m
[32m+[m[32m    <main className="flex w-full h-screen items-center justify-center overflow-hidden ">[m
[32m+[m[32m        <div className="flex flex-col w-150 h-full justify-center items-center bg-orange-300  shadow-xl pt-0 p-5 z-10">[m
[32m+[m
[32m+[m[32m            <h1 className="text-2xl font-bold">Admin Panel</h1>[m
[32m+[m
[32m+[m[32m            <div className="flex flex-row gap-8 pb-5">[m
[32m+[m[41m                [m
[32m+[m[32m                <Link href='/admin/volei' className="flex flex-col items-center rounded-xl shadow-xl p-2 hover:bg-orange-500" >[m
[32m+[m[32m                    <Image src="/volei.png" alt="Volei de Praia" width={150} height={150} />[m
[32m+[m[32m                    Volei de Praia[m
[32m+[m[32m                </Link>[m
[32m+[m
[32m+[m[32m                <Link href="#" className="flex flex-col items-center rounded-xl shadow-xl p-2 hover:bg-orange-500">[m
[32m+[m[32m                    <Image src="/soccer.png" alt="Beach Soccer" width={150} height={150} />[m
[32m+[m[32m                    Beach Soccer[m
[32m+[m[32m                </Link>[m
[32m+[m
[32m+[m[32m                <Link href='/admin/futevolei'className="flex flex-col items-center rounded-xl shadow-xl p-2 hover:bg-orange-500">[m
[32m+[m[32m                    <Image src="/futevolei.png" alt="Futevolei" width={150} height={150} />[m
[32m+[m[32m                    Futevolei[m
[32m+[m[32m                </Link>[m
[32m+[m[32m            </div>[m
[32m+[m
[32m+[m[32m        </div>[m
[32m+[m[32m    </main>[m
[32m+[m[32m    </>[m
[32m+[m[32m  );[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/(admin)/admin/volei/page.tsx b/src/app/(admin)/admin/volei/page.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..46483e5[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/admin/volei/page.tsx[m
[36m@@ -0,0 +1,31 @@[m
[32m+[m[32mimport { getServerSession } from "next-auth";[m
[32m+[m[32mimport { authOptions } from "@/lib/auth";[m
[32m+[m[32mimport VoleiClient from "./voleiclient";[m
[32m+[m
[32m+[m[32mexport default async function VoleiPost() {[m
[32m+[m
[32m+[m[32m  // Obtém a sessão do usuário autenticado no lado do servidor definidas em `authOptions`[m
[32m+[m[32m  const session = await getServerSession(authOptions);[m
[32m+[m
[32m+[m[32m  //verifica se o usuário está logado ou se ele é um administrador através do role[m
[32m+[m[32m    if (!session || session.user.role !== "admin") {[m
[32m+[m[32m      return ([m
[32m+[m[32m          <main className="flex w-full h-screen items-center justify-center overflow-hidden ">[m
[32m+[m[32m          <div className="flex flex-col items-center justify-center w-xl h-screen bg-orange-300">[m
[32m+[m[32m              <h1 className="text-2xl font-bold">Acesso Negado!</h1>[m
[32m+[m[32m              <p className="text-lg">Você não tem permissão para acessar esta página.</p>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          </main>[m
[32m+[m[32m      );[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m    <main className="flex w-full min-h-screen items-center justify-center overflow-y-auto">[m
[32m+[m[32m      <div className="flex flex-col w-full max-w-4xl items-center bg-orange-300 shadow-xl p-5 z-10">[m
[32m+[m[32m        <VoleiClient />[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </main>[m
[32m+[m[32m  );[m
[32m+[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/(admin)/admin/volei/voleiclient.tsx b/src/app/(admin)/admin/volei/voleiclient.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..637767b[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/admin/volei/voleiclient.tsx[m
[36m@@ -0,0 +1,93 @@[m
[32m+[m[32m'use client';[m
[32m+[m
[32m+[m[32mimport EditorBloco from "@/app/components/editor/editor";[m
[32m+[m[32mimport { useState } from "react";[m
[32m+[m[32mimport { Button } from 'primereact/button';[m
[32m+[m[32mimport { voleiService } from "@/services";[m
[32m+[m[32mimport { useSession } from "next-auth/react";[m
[32m+[m
[32m+[m
[32m+[m[32mexport default function VoleiClient() {[m
[32m+[m
[32m+[m[32m    // Obtém os dados da sessão atual do usuário logado com NextAuth[m
[32m+[m[32m    // "data" é renomeado para "session" para facilitar o uso[m
[32m+[m[32m    const { data: session } = useSession()[m[41m [m
[32m+[m
[32m+[m[32m    const [content, setContent] = useState('');[m
[32m+[m[32m    const [title, setTitle] = useState('');[m
[32m+[m[32m    const [picture, setPicture] = useState('');[m
[32m+[m[32m    const [description, setDescription] = useState('');[m
[32m+[m
[32m+[m[32m    // Função usada para receber o conteúdo do editor e atualizar o estado 'content'[m
[32m+[m[32m    const sourceData = (data: any) => {[m
[32m+[m[32m        setContent(data);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    // Função usada para receber o título e atualizar o estado 'title'[m
[32m+[m[32m    const sourceTitle = (title: any) => {[m
[32m+[m[32m        setTitle(title);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const sourceThumbnail = (thumbnail: any) => {[m
[32m+[m[32m        setPicture(thumbnail);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const sourceDescription = (description: any) => {[m
[32m+[m[32m        setDescription(description);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    // Função assíncrona que será chamada ao clicar no botão 'Salvar'[m
[32m+[m[32m    const handleSubmit = async () => {[m
[32m+[m
[32m+[m[32m        //monta o corpo da requisição com os dados do post[m
[32m+[m[32m        const body = {[m
[32m+[m[32m            title: title,[m
[32m+[m[32m            content: content,[m
[32m+[m[32m            picture: picture,[m[41m [m
[32m+[m[32m            description: description,[m
[32m+[m[32m            published: false,[m
[32m+[m[32m            authorId: session?.user.id[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m        // Chama o serviço responsável por salvar o post no banco de dados[m
[32m+[m[32m        const result = await voleiService(body)[m
[32m+[m
[32m+[m[32m        // Verifica se a resposta foi bem-sucedida e limpa o editor após salvo[m
[32m+[m[32m        if (result) {[m
[32m+[m[32m            setTitle('');[m
[32m+[m[32m            setContent('');[m
[32m+[m[32m            alert('Post salvo com sucesso!');[m
[32m+[m[32m            window.location.reload()[m
[32m+[m[32m        } else {[m
[32m+[m[32m            alert('Erro ao salvar o post.');[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m        <>[m
[32m+[m[32m            <main className="flex w-full items-center justify-center">[m
[32m+[m[32m                <div className="flex flex-col w-170 items-center bg-orange-300  shadow-xl pt-0 p-5 z-10 ">[m
[32m+[m[32m                    <EditorBloco[m
[32m+[m[32m                        content={content}[m
[32m+[m[32m                        title={title}[m
[32m+[m[32m                        picture={picture}[m
[32m+[m[32m                        description={description}[m
[32m+[m[32m                        sourceDescription={setDescription}[m
[32m+[m[32m                        sourceData={setContent}[m
[32m+[m[32m                        sourceTitle={setTitle}[m
[32m+[m[32m                        sourceThumbnail={sourceThumbnail}[m
[32m+[m[32m                    />[m
[32m+[m[32m                    <div className="flex justify-center  items-center mt-4">[m
[32m+[m[32m                        <Button[m
[32m+[m[32m                            label="Salvar"[m
[32m+[m[32m                            className="curor-point shadow-lg flex flex-col w-full justify-center items-center rounded-xl p-2 hover:bg-orange-500"[m
[32m+[m[32m                            onClick={handleSubmit}[m
[32m+[m[32m                        />[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            </main>[m
[32m+[m[32m        </>[m
[32m+[m[32m    )[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/(admin)/components/header/header.tsx b/src/app/(admin)/components/header/header.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..3e9411e[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/components/header/header.tsx[m
[36m@@ -0,0 +1,68 @@[m
[32m+[m[32m'use client';[m
[32m+[m
[32m+[m[32mimport Image from "next/image";[m
[32m+[m[32mimport Link from "next/link";[m
[32m+[m[32mimport { FiUser, FiLogOut, FiSettings } from "react-icons/fi";[m
[32m+[m[32mimport { GiExitDoor } from "react-icons/gi";[m
[32m+[m[32mimport { signIn, signOut, useSession } from "next-auth/react";[m
[32m+[m
[32m+[m[32mexport default function Header() {[m
[32m+[m[32m  const { status, data } = useSession()[m
[32m+[m
[32m+[m[32m  async function handleLogin() {[m
[32m+[m[32m    await signIn()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  async function handlelogout() {[m
[32m+[m[32m    await signOut()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  return ([m
[32m+[m[32m    <header className="flex flex-row justify-between items-center w-full h-20 bg-orange-300 shadow-xl p-4 border-b-amber-950 border-b-1 z-10">[m
[32m+[m[32m      <div className="flex items-center">[m
[32m+[m[32m        <Link href='/'>[m
[32m+[m[32m          <Image[m
[32m+[m[32m            src="/logoestendida.png"[m
[32m+[m[32m            alt="BeachScore"[m
[32m+[m[32m            width={190}[m
[32m+[m[32m            height={100}[m
[32m+[m[32m            priority[m
[32m+[m[32m            quality={100}[m
[32m+[m[32m          />[m
[32m+[m[32m        </Link>[m
[32m+[m[32m      </div>[m
[32m+[m
[32m+[m[32m      {status === "authenticated" ? ([m
[32m+[m[32m        <nav className="flex space-x-4">[m
[32m+[m[32m          <Link href="/admin" className="text-lg hover:text-orange-500">[m
[32m+[m[32m            <FiUser size={26} color="#1c1917" />[m
[32m+[m[32m          </Link>[m
[32m+[m
[32m+[m[32m          <Link href="/configuracoes" className="text-lg hover:text-orange-500" title="Configurações" aria-label="Configurações">[m
[32m+[m[32m            <FiSettings size={30} color="#1c1917" />[m
[32m+[m[32m          </Link>[m
[32m+[m[32m          <button[m
[32m+[m[32m            onClick={handlelogout}[m
[32m+[m[32m            className="text-lg hover:text-orange-500"[m
[32m+[m[32m            title="deslogar"[m
[32m+[m[32m            aria-label="deslogar"[m
[32m+[m[32m          >[m
[32m+[m[32m            <GiExitDoor size={30} color="#f11" />[m
[32m+[m[32m          </button>[m
[32m+[m[32m        </nav>[m
[32m+[m
[32m+[m[32m      ) : ([m
[32m+[m[32m        <nav className="flex space-x-4">[m
[32m+[m[32m          <button[m
[32m+[m[32m            onClick={handleLogin}[m
[32m+[m[32m            className="cursor-point shadow-lg flex flex-col justify-center items-center rounded-xl p-2 hover:bg-orange-500"[m
[32m+[m[32m            title="Login"[m
[32m+[m[32m            aria-label="Login"[m
[32m+[m[32m          >[m
[32m+[m[32m            <h1 className="text-amber-950 text-3xl font-extrabold tracking-wide">Login</h1>[m
[32m+[m[32m          </button>[m
[32m+[m[32m        </nav>[m
[32m+[m[32m      )}[m
[32m+[m[32m    </header>[m
[32m+[m[32m  );[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/(admin)/layout.tsx b/src/app/(admin)/layout.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..fdf4ef1[m
[1m--- /dev/null[m
[1m+++ b/src/app/(admin)/layout.tsx[m
[36m@@ -0,0 +1,28 @@[m
[32m+[m[32mimport type { Metadata } from "next";[m
[32m+[m[32mimport "@/app/globals.css";[m
[32m+[m[32mimport Image from "next/image";[m
[32m+[m[32mimport Header from "./components/header/header";[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32mexport const metadata: Metadata = {[m
[32m+[m[32m  title: "Create Next App",[m
[32m+[m[32m  description: "Generated by create next app",[m
[32m+[m[32m};[m
[32m+[m
[32m+[m[32mexport default function RootLayout({[m
[32m+[m[32m  children,[m
[32m+[m[32m}: Readonly<{[m
[32m+[m[32m  children: React.ReactNode;[m
[32m+[m[32m}>) {[m
[32m+[m[32m  return ([m
[32m+[m[32m    <html lang="pt-BR">[m
[32m+[m[32m      <body>[m
[32m+[m[32m      <Header/>[m
[32m+[m[32m        <div className="relative w-full  z-100">[m
[32m+[m[32m          {children}[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </body>[m
[32m+[m[32m    </html>[m
[32m+[m[32m  );[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/api/auth/[...nextauth]/route.ts b/src/app/api/auth/[...nextauth]/route.ts[m
[1mnew file mode 100644[m
[1mindex 0000000..d7cd5ad[m
[1m--- /dev/null[m
[1m+++ b/src/app/api/auth/[...nextauth]/route.ts[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32mimport NextAuth from "next-auth";[m
[32m+[m[32mimport { authOptions } from "@/lib/auth";[m
[32m+[m
[32m+[m[32mconst handler = NextAuth(authOptions)[m
[32m+[m
[32m+[m[32mexport { handler as GET, handler as POST };[m
\ No newline at end of file[m
[1mdiff --git a/src/app/api/beachsoccer/route.ts b/src/app/api/beachsoccer/route.ts[m
[1mnew file mode 100644[m
[1mindex 0000000..c3b8638[m
[1m--- /dev/null[m
[1m+++ b/src/app/api/beachsoccer/route.ts[m
[36m@@ -0,0 +1,36 @@[m
[32m+[m[32mimport { NextResponse } from 'next/server';[m
[32m+[m[32mimport prisma from '@/lib/prisma';[m
[32m+[m
[32m+[m[32mexport async function POST(req: Request) {[m
[32m+[m[32m    try {[m
[32m+[m[32m        const body = await req.json();[m
[32m+[m[32m        const {[m
[32m+[m[32m            title,[m
[32m+[m[32m            content,[m
[32m+[m[32m            description,[m
[32m+[m[32m            picture,[m
[32m+[m[32m            published = false,[m
[32m+[m[32m            authorId[m
[32m+[m[32m    } = body;[m
[32m+[m
[32m+[m[32m    if (!title) {[m
[32m+[m[32m        return NextResponse.json({ error: 'Título é obrigatório' }, { status: 400 });[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const newPost = await prisma.postSoccer.create({[m
[32m+[m[32m        data: {[m
[32m+[m[32m            title,[m
[32m+[m[32m            picture,[m
[32m+[m[32m            description,[m
[32m+[m[32m            content,[m
[32m+[m[32m            published,[m
[32m+[m[32m            authorId,[m
[32m+[m[32m        },[m
[32m+[m[32m    });[m
[32m+[m
[32m+[m[32m    return NextResponse.json(newPost, { status: 201 });[m
[32m+[m[32m    } catch (error) {[m
[32m+[m[32m        console.error('Erro ao criar post de beachsoccer:', error);[m
[32m+[m[32m        return NextResponse.json({ error: 'Erro interno no servidor' }, { status: 500 });[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/api/futevolei/route.ts b/src/app/api/futevolei/route.ts[m
[1mnew file mode 100644[m
[1mindex 0000000..b29c1a7[m
[1m--- /dev/null[m
[1m+++ b/src/app/api/futevolei/route.ts[m
[36m@@ -0,0 +1,36 @@[m
[32m+[m[32mimport { NextResponse } from 'next/server';[m
[32m+[m[32mimport prisma from '@/lib/prisma';[m
[32m+[m
[32m+[m[32mexport async function POST(req: Request) {[m
[32m+[m[32m    try {[m
[32m+[m[32m        const body = await req.json();[m
[32m+[m[32m        const {[m
[32m+[m[32m            title,[m
[32m+[m[32m            content,[m
[32m+[m[32m            picture,[m
[32m+[m[32m            description,[m[41m [m
[32m+[m[32m            published = false,[m
[32m+[m[32m            authorId[m
[32m+[m[32m    } = body;[m
[32m+[m
[32m+[m[32m    if (!title) {[m
[32m+[m[32m        return NextResponse.json({ error: 'Título é obrigatório' }, { status: 400 });[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    const newPost = await prisma.postfutevolei.create({[m
[32m+[m[32m        data: {[m
[32m+[m[32m            title,[m
[32m+[m[32m            content,[m
[32m+[m[32m            picture,[m
[32m+[m[32m            description,[m
[32m+[m[32m            published,[m
[32m+[m[32m            authorId,[m
[32m+[m[32m        },[m
[32m+[m[32m    });[m
[32m+[m
[32m+[m[32m    return NextResponse.json(newPost, { status: 201 });[m
[32m+[m[32m    } catch (error) {[m
[32m+[m[32m        console.error('Erro ao criar post de futevolei:', error);[m
[32m+[m[32m        return NextResponse.json({ error: 'Erro interno no servidor' }, { status: 500 });[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/api/volei/route.ts b/src/app/api/volei/route.ts[m
[1mnew file mode 100644[m
[1mindex 0000000..d1e205b[m
[1m--- /dev/null[m
[1m+++ b/src/app/api/volei/route.ts[m
[36m@@ -0,0 +1,40 @@[m
[32m+[m[32mimport { NextResponse } from 'next/server';[m
[32m+[m[32mimport prisma from '@/lib/prisma';[m
[32m+[m
[32m+[m[32mexport async function POST(req: Request) {[m
[32m+[m[32m    try {[m
[32m+[m[32m        const body = await req.json();[m
[32m+[m[32m        const {[m
[32m+[m[32m            title,[m
[32m+[m[32m            picture,[m
[32m+[m[32m            description,[m
[32m+[m[32m            content,[m
[32m+[m[32m            published = false,[m
[32m+[m[32m            authorId[m
[32m+[m[32m        } = body;[m
[32m+[m
[32m+[m[32m        if (!title) {[m
[32m+[m[32m            return NextResponse.json({ error: 'Título é obrigatório' }, { status: 400 });[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m        if (!description) {[m
[32m+[m[32m            return NextResponse.json({ error: 'A descrição é obrigatória' }, { status: 400 });[m
[32m+[m[32m        }[m
[32m+[m
[32m+[m[32m        const newPost = await prisma.postVolei.create({[m
[32m+[m[32m            data: {[m
[32m+[m[32m                title,[m
[32m+[m[32m                picture,[m
[32m+[m[32m                description,[m
[32m+[m[32m                content,[m
[32m+[m[32m                published,[m
[32m+[m[32m                authorId,[m
[32m+[m[32m            },[m
[32m+[m[32m        });[m
[32m+[m
[32m+[m[32m        return NextResponse.json(newPost, { status: 201 });[m
[32m+[m[32m    } catch (error) {[m
[32m+[m[32m        console.error('Erro ao criar post de vôlei:', error);[m
[32m+[m[32m        return NextResponse.json({ error: 'Erro interno no servidor' }, { status: 500 });[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/beachsoccer/[id]/page.tsx b/src/app/beachsoccer/[id]/page.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..dfeb100[m
[1m--- /dev/null[m
[1m+++ b/src/app/beachsoccer/[id]/page.tsx[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32mimport prisma from "@/lib/prisma";[m
[32m+[m
[32m+[m[32masync function fetchPosts(id: string) {[m
[32m+[m[32m    const posts = await prisma.postSoccer.findUnique({[m
[32m+[m[32m        where: {[m
[32m+[m[32m            id: id[m
[32m+[m[32m        }[m
[32m+[m[32m    });[m
[32m+[m[32m    return posts;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default async function Volei([m
[32m+[m[32m    {params}: { params: { id: string } }[m
[32m+[m[32m){[m
[32m+[m[32m    const post = await fetchPosts(params.id);[m
[32m+[m[32m    return ([m
[32m+[m[32m        <main className="flex w-full h-auto justify-center overflow-y-auto overflow-x-auto break-words">[m
[32m+[m[32m            <div className="flex flex-col w-full h-full max-w-4xl items-center bg-orange-300 shadow-xl overflow-x-auto break-words pl-15 pr-15 z-10">[m
[32m+[m[32m                <h1 className="text-2xl font-bold w-full break-words overflow-x-auto prose max-w-none pt-7">{post?.title}</h1>[m
[32m+[m[32m                <div dangerouslySetInnerHTML={{ __html: post?.content ?? '' }}[m
[32m+[m[32m                className="text-lg mt-4 mb-6 w-full break-words overflow-x-auto prose max-w-none pt-5" />[m
[32m+[m[32m            </div>[m
[32m+[m[32m        </main>[m
[32m+[m[32m    )[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/beachsoccer/layout.tsx b/src/app/beachsoccer/layout.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..8e3aaa2[m
[1m--- /dev/null[m
[1m+++ b/src/app/beachsoccer/layout.tsx[m
[36m@@ -0,0 +1,28 @@[m
[32m+[m[32mimport type { Metadata } from "next";[m
[32m+[m[32mimport "@/app/globals.css";[m
[32m+[m[32mimport Image from "next/image";[m
[32m+[m[32mimport Header from "@/app/components/header/header";[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32mexport const metadata: Metadata = {[m
[32m+[m[32m  title: "Create Next App",[m
[32m+[m[32m  description: "Generated by create next app",[m
[32m+[m[32m};[m
[32m+[m
[32m+[m[32mexport default function RootLayout({[m
[32m+[m[32m  children,[m
[32m+[m[32m}: Readonly<{[m
[32m+[m[32m  children: React.ReactNode;[m
[32m+[m[32m}>) {[m
[32m+[m[32m  return ([m
[32m+[m[32m    <html lang="pt-BR">[m
[32m+[m[32m      <body>[m
[32m+[m[32m      <Header/>[m
[32m+[m[32m        <div className="relative w-full  z-100">[m
[32m+[m[32m          {children}[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </body>[m
[32m+[m[32m    </html>[m
[32m+[m[32m  );[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/beachsoccer/page.tsx b/src/app/beachsoccer/page.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..ed25a82[m
[1m--- /dev/null[m
[1m+++ b/src/app/beachsoccer/page.tsx[m
[36m@@ -0,0 +1,57 @@[m
[32m+[m[32mimport prisma from '@/lib/prisma';[m
[32m+[m[32mimport Link from 'next/link';[m
[32m+[m[32mimport Image from 'next/image';[m
[32m+[m
[32m+[m
[32m+[m[32mexport default async function FutevoleiFeed() {[m
[32m+[m
[32m+[m[32m    const posts = await prisma.postVolei.findMany({[m
[32m+[m[32m        orderBy: { createdAt: 'desc' },[m
[32m+[m[32m    });[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m        <main className="flex w-full h-auto justify-center overflow-y-auto overflow-x-auto break-words">[m
[32m+[m[32m            <div className="flex flex-col w-full h-full max-w-4xl items-center bg-orange-300 shadow-xl p-5 z-10">[m
[32m+[m[32m                <h1 className="text-2xl font-bold mb-4">BeachSoccer</h1>[m
[32m+[m[32m                {posts.length === 0 ? ([m
[32m+[m[32m                    <p className="text-lg mb-6">Nenhum post encontrado.</p>[m
[32m+[m[32m                ) : ([m
[32m+[m
[32m+[m[32m                    posts.map(post => ([m
[32m+[m[32m                        <Link href={`/volei/${post.id}`} key={post.id} className="w-full">[m
[32m+[m[32m                            <div key={post.id} className="flex flex-col sm:flex-row w-full p-4 rounded-lg mb-4 shadow bg-white">[m
[32m+[m[32m                                {post.picture && ([m
[32m+[m[32m                                    <img[m
[32m+[m[32m                                        src={post.picture}[m
[32m+[m[32m                                        alt={post.title}[m
[32m+[m[32m                                        className="w-full sm:w-40 h-auto object-cover rounded mb-4 sm:mb-0"[m
[32m+[m[32m                                    />[m
[32m+[m[32m                                )}[m
[32m+[m
[32m+[m[32m                                <div className="sm:ml-4 flex flex-col justify-between">[m
[32m+[m[32m                                    <h2 className="text-lg sm:text-xl font-semibold text-amber-900">{post.title}</h2>[m
[32m+[m
[32m+[m[32m                                    <div[m
[32m+[m[32m                                        className="text-sm text-gray-700 mt-2"[m
[32m+[m[32m                                        dangerouslySetInnerHTML={{ __html: post.description ?? '' }}[m
[32m+[m[32m                                    />[m
[32m+[m
[32m+[m[32m                                    <p className="text-xs text-gray-500 mt-4">[m
[32m+[m[32m                                        Publicado em: {new Date(post.createdAt).toLocaleDateString()}[m
[32m+[m[32m                                    </p>[m
[32m+[m[32m                                </div>[m
[32m+[m[32m                            </div>[m
[32m+[m[32m                        </Link>[m
[32m+[m[32m                    ))[m
[32m+[m[32m                )}[m
[32m+[m
[32m+[m[32m                {/* <img src="/images/futevolei.jpg" alt="Futevôlei" className="w-full h-auto rounded-lg shadow-md" /> */}[m
[32m+[m[32m            </div>[m
[32m+[m[32m        </main>[m
[32m+[m[32m    );[m
[32m+[m
[32m+[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/components/cards/index.tsx b/src/app/components/cards/index.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/src/app/components/description/index.tsx b/src/app/components/description/index.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..d4b5827[m
[1m--- /dev/null[m
[1m+++ b/src/app/components/description/index.tsx[m
[36m@@ -0,0 +1,53 @@[m
[32m+[m[32m'use client';[m
[32m+[m[32mimport React, { useEffect, useRef } from 'react';[m
[32m+[m[32mimport 'quill/dist/quill.snow.css';[m
[32m+[m
[32m+[m[32minterface DescriptionProps {[m
[32m+[m[32m    description: string;[m
[32m+[m[32m    sourceDescription: (value: string) => void;[m
[32m+[m[32m    placeholder?: string;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default function Description({ description, placeholder, sourceDescription }: DescriptionProps) {[m
[32m+[m[32m    const editorRef = useRef<HTMLDivElement>(null);[m
[32m+[m
[32m+[m
[32m+[m[32m    useEffect(() => {[m
[32m+[m[32m        if (typeof window === "undefined" || !editorRef.current) return;[m
[32m+[m
[32m+[m[32m        let quill: any[m
[32m+[m[32m        let mounted = true;[m
[32m+[m
[32m+[m[32m        (async () => {[m
[32m+[m[32m            const Quill = (await import('quill')).default;[m
[32m+[m[32m            if (!mounted) return;[m
[32m+[m[32m            quill = new Quill(editorRef.current!, {[m
[32m+[m[32m                theme: 'bubble',[m
[32m+[m[32m                placeholder: placeholder || 'Adicione sua descrição',[m
[32m+[m[32m                modules: {[m
[32m+[m[32m                    toolbar: false,[m[41m [m
[32m+[m[32m                },[m
[32m+[m[32m            })[m
[32m+[m
[32m+[m
[32m+[m[32m            if (description && quill.root.innerHTML !== description) {[m
[32m+[m[32m                quill.clipboard.dangerouslyPasteHTML(description);[m
[32m+[m[32m            }[m
[32m+[m
[32m+[m[32m            quill.on('text-change', () => {[m
[32m+[m[32m                const htmlValue = quill.root.innerHTML;[m
[32m+[m[32m                sourceDescription(htmlValue);[m
[32m+[m[32m            });[m
[32m+[m[32m        })()[m
[32m+[m
[32m+[m[32m        return () => {[m
[32m+[m[32m            mounted = false;[m
[32m+[m[32m        };[m
[32m+[m[32m    }, [sourceDescription]);[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m        <div className='w-full h-auto p-0 bg-white rounded-lg shadow-md mt-4'>[m
[32m+[m[32m            <div ref={editorRef} />[m
[32m+[m[32m        </div>[m
[32m+[m[32m    );[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/components/editor/editor.tsx b/src/app/components/editor/editor.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..bcc35a6[m
[1m--- /dev/null[m
[1m+++ b/src/app/components/editor/editor.tsx[m
[36m@@ -0,0 +1,70 @@[m
[32m+[m[32m'use client';[m
[32m+[m[32mimport React from "react";[m
[32m+[m[32mimport { Editor } from "primereact/editor";[m
[32m+[m[32mimport { InputText } from 'primereact/inputtext';[m
[32m+[m[32mimport Thumbnails from "../thumbnails/thumbnails";[m
[32m+[m[32mimport Description from "../description/index"[m
[32m+[m[32mimport './styles/quillFix.css';[m
[32m+[m
[32m+[m[32m// Define a interface para os props que o componente EditorBloco irá receber[m
[32m+[m[32minterface EditorBlocoProps {[m
[32m+[m[32m    content: string;[m
[32m+[m[32m    title: string;[m
[32m+[m[32m    picture: string;[m
[32m+[m[32m    description: string;[m
[32m+[m[32m    sourceData: (value: string) => void; // Função para atualizar o conteúdo no componente pai em tempo real para o usuário[m
[32m+[m[32m    sourceTitle: (value: string) => void; // Função para atualizar o conteúdo no componente pai em tempo real para o usuário[m
[32m+[m[32m    sourceThumbnail: (value: string) => void; // Função para atualizar a miniatura no componente pai[m
[32m+[m[32m    sourceDescription: (value: string) => void; // Função para atualizar a descrição no componente pai[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m// Componente principal que representa o editor de texto e campo de título[m
[32m+[m[32mexport default function EditorBloco({ sourceData,sourceDescription, sourceTitle, sourceThumbnail, content,[m
[32m+[m[32m    title, picture, description }: EditorBlocoProps) {[m
[32m+[m[41m        [m
[32m+[m
[32m+[m[32m    //função que envia o conteúdo para a api[m
[32m+[m[32m    const handleSave = async () => {[m
[32m+[m[32m        const res = await fetch('/api/salvarTexto', {[m
[32m+[m[32m            method: 'POST',[m
[32m+[m[32m            headers: { 'Content-Type': 'application/json' },[m
[32m+[m[32m            body: JSON.stringify({[m[41m [m
[32m+[m[32m                content: content,[m
[32m+[m[32m                description: description,[m
[32m+[m[32m            })[m
[32m+[m[41m            [m
[32m+[m[32m        });[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m        <div className="card p-4 space-y-4 flex flex-col justify-center items-center overflow-x-auto break-words" >[m
[32m+[m[32m            <label className="block font-serif font-bold text-amber-950">Título</label>[m
[32m+[m[32m            <InputText[m
[32m+[m[32m                value={title}[m
[32m+[m[32m                onChange={(e) => sourceTitle(e.target.value)}[m
[32m+[m[32m                type="text"[m
[32m+[m[32m                placeholder="Digite o título do post"[m
[32m+[m[32m                className="w-full bg-white border border-gray-300 rounded-lg p-2 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent"[m
[32m+[m[32m            />[m
[32m+[m[32m            <label className="block font-serif font-bold text-amber-950 mt-6">Miniatura</label>[m
[32m+[m[32m            <Thumbnails[m
[32m+[m[32m                picture={picture}[m
[32m+[m[32m                sourceThumbnail={sourceThumbnail}[m
[32m+[m[32m            />[m
[32m+[m
[32m+[m[32m            <label className="block font-serif font-bold text-amber-950 mt-6">Descrição</label>[m
[32m+[m[32m            <Description[m
[32m+[m[32m                description={description}[m
[32m+[m[32m                sourceDescription={sourceDescription}[m
[32m+[m[32m            />[m
[32m+[m[32m            <label className="block font-semibold m-4 text-amber-950">Conteúdo</label>[m
[32m+[m[32m            <Editor[m
[32m+[m[32m                value={content}[m
[32m+[m[32m                onTextChange={(e) => sourceData(e.htmlValue ?? '')}[m
[32m+[m[32m                style={{ height: '320px' }}[m
[32m+[m[32m                className="bg-white border border-gray-300 rounded-lg"[m
[32m+[m[32m            />[m
[32m+[m[32m        </div>[m
[32m+[m[32m    )[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/components/editor/styles/quillFix.css b/src/app/components/editor/styles/quillFix.css[m
[1mnew file mode 100644[m
[1mindex 0000000..f8afdce[m
[1m--- /dev/null[m
[1m+++ b/src/app/components/editor/styles/quillFix.css[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32m.ql-editor {[m
[32m+[m[32m    max-width: 100%;[m
[32m+[m[32m    overflow-wrap: break-word;[m
[32m+[m[32m    word-break: break-word;[m
[32m+[m[32m    white-space: normal;[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/components/header/header.tsx b/src/app/components/header/header.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..8db7f61[m
[1m--- /dev/null[m
[1m+++ b/src/app/components/header/header.tsx[m
[36m@@ -0,0 +1,66 @@[m
[32m+[m[32m'use client';[m
[32m+[m
[32m+[m[32mimport Image from "next/image";[m
[32m+[m[32mimport Link from "next/link";[m
[32m+[m[32mimport {FiUser, FiLogOut, FiSettings} from "react-icons/fi";[m[41m [m
[32m+[m[32mimport { GiExitDoor } from "react-icons/gi";[m
[32m+[m[32mimport {signIn, signOut, useSession} from "next-auth/react";[m
[32m+[m
[32m+[m[32mexport default function Header() {[m
[32m+[m[32m  const {status, data} = useSession()[m
[32m+[m
[32m+[m[32m  async function handleLogin() {[m
[32m+[m[32m    await signIn()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  async function handlelogout() {[m
[32m+[m[32m    await signOut()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  return ([m
[32m+[m[32m    <header className="flex flex-row justify-between items-center w-full h-20 bg-orange-300 shadow-xl p-4 border-b-amber-950 border-b-1 z-10">[m
[32m+[m[32m      <div className="flex items-center">[m
[32m+[m[32m        <Image[m
[32m+[m[32m          src="/logoestendida.png"[m
[32m+[m[32m          alt="BeachScore"[m[41m [m
[32m+[m[32m          width={190}[m
[32m+[m[32m          height={100}[m
[32m+[m[32m          priority[m
[32m+[m[32m          quality={100}[m[41m [m
[32m+[m[32m          />[m
[32m+[m[32m      </div>[m
[32m+[m[41m     [m
[32m+[m[32m      {status === "authenticated" ? ([m
[32m+[m[32m        <nav className="flex space-x-4">[m
[32m+[m[32m        <Link href="/admin" className="text-lg hover:text-orange-500">[m
[32m+[m[32m        <FiUser size={26} color="#1c1917"/>[m
[32m+[m[32m        </Link>[m
[32m+[m
[32m+[m[32m        <Link href="/configuracoes" className="text-lg hover:text-orange-500" title="Configurações" aria-label="Configurações">[m
[32m+[m[32m          <FiSettings size={30} color="#1c1917"/>[m
[32m+[m[32m        </Link>[m
[32m+[m[32m        <button[m
[32m+[m[32m          onClick={handlelogout}[m
[32m+[m[32m          className="text-lg hover:text-orange-500"[m
[32m+[m[32m          title="deslogar"[m
[32m+[m[32m          aria-label="deslogar"[m
[32m+[m[32m        >[m
[32m+[m[32m          <GiExitDoor size={30} color="#f11"/>[m
[32m+[m[32m        </button>[m
[32m+[m[32m        </nav>[m
[32m+[m
[32m+[m[32m        ) : ([m
[32m+[m[32m          <nav className="flex space-x-4">[m
[32m+[m[32m          <button[m
[32m+[m[32m            onClick={handleLogin}[m
[32m+[m[32m            className="curor-point shadow-lg flex flex-col justify-center items-center rounded-xl p-2 hover:bg-orange-500"[m
[32m+[m[32m            title="Login"[m
[32m+[m[32m            aria-label="Login"[m
[32m+[m[32m          >[m
[32m+[m[32m            <h1 className="text-amber-950 text-3xl font-extrabold tracking-wide">Login</h1>[m
[32m+[m[32m          </button>[m
[32m+[m[32m          </nav>[m
[32m+[m[32m        )}[m
[32m+[m[32m    </header>[m
[32m+[m[32m  );[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/components/thumbnails/thumbnails.module.css b/src/app/components/thumbnails/thumbnails.module.css[m
[1mnew file mode 100644[m
[1mindex 0000000..6c8351f[m
[1m--- /dev/null[m
[1m+++ b/src/app/components/thumbnails/thumbnails.module.css[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m.hiddenInput {[m
[32m+[m[32m    display: none;[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/components/thumbnails/thumbnails.tsx b/src/app/components/thumbnails/thumbnails.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..9163628[m
[1m--- /dev/null[m
[1m+++ b/src/app/components/thumbnails/thumbnails.tsx[m
[36m@@ -0,0 +1,83 @@[m
[32m+[m[32m'use client';[m
[32m+[m[32mimport React, { useEffect, useRef } from 'react';[m
[32m+[m[32mimport 'quill/dist/quill.snow.css';[m
[32m+[m[32mimport styles from './thumbnails.module.css';[m
[32m+[m
[32m+[m[32minterface ThumbnailsProps {[m
[32m+[m[32m    picture: string;[m
[32m+[m[32m    sourceThumbnail: (value: string) => void;[m
[32m+[m[32m    placeholder?: string;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mexport default function Thumbnails({ picture, sourceThumbnail, placeholder }: ThumbnailsProps) {[m
[32m+[m[32m    const editorRef = useRef<HTMLDivElement>(null);[m
[32m+[m[32m    const fileInputRef = useRef<HTMLInputElement>(null);[m
[32m+[m
[32m+[m[32m    const handleImageUpload = (file: File) => {[m
[32m+[m[32m        const reader = new FileReader();[m
[32m+[m[32m        reader.onloadend = () => {[m
[32m+[m[32m            sourceThumbnail(reader.result as string);[m
[32m+[m[32m        };[m
[32m+[m[32m        reader.readAsDataURL(file);[m
[32m+[m[32m    };[m
[32m+[m
[32m+[m[32m    useEffect(() => {[m
[32m+[m[32m        if (typeof window === "undefined" || !editorRef.current) return;[m
[32m+[m
[32m+[m[32m        let quill: any;[m
[32m+[m[32m        let mounted = true;[m
[32m+[m
[32m+[m[32m        (async () => {[m
[32m+[m[32m            const Quill = (await import('quill')).default;[m
[32m+[m[32m            if (!mounted) return;[m
[32m+[m[32m            quill = new Quill(editorRef.current!, {[m
[32m+[m[32m                theme: 'snow',[m
[32m+[m[32m                placeholder: placeholder || 'Adicione sua miniatura clicando no ícone acima...',[m
[32m+[m[32m                modules: {[m
[32m+[m[32m                    toolbar: {[m
[32m+[m[32m                        container: [['image']],[m
[32m+[m[32m                        handlers: {[m
[32m+[m[32m                            image: () => fileInputRef.current?.click(),[m
[32m+[m[32m                        },[m
[32m+[m[32m                    },[m
[32m+[m[32m                },[m
[32m+[m[32m            });[m
[32m+[m[32m        })();[m
[32m+[m
[32m+[m[32m        return () => {[m
[32m+[m[32m            mounted = false;[m
[32m+[m[32m        };[m
[32m+[m[32m    }, [placeholder]);[m
[32m+[m
[32m+[m[32m    return ([m
[32m+[m[32m        <div className='w-full h-auto p-0 bg-white rounded-lg shadow-md mt-4'>[m
[32m+[m[32m            <label htmlFor="thumbnail-upload" className="sr-only">[m
[32m+[m[32m                Selecionar imagem para thumbnail[m
[32m+[m[32m            </label>[m
[32m+[m[32m            <input[m
[32m+[m[32m                id="thumbnail-upload"[m
[32m+[m[32m                type="file"[m
[32m+[m[32m                accept="image/*"[m
[32m+[m[32m                className={styles.hiddenInput}[m
[32m+[m[32m                ref={fileInputRef}[m
[32m+[m[32m                title="Selecionar imagem para thumbnail"[m
[32m+[m[32m                onChange={e => {[m
[32m+[m[32m                    const file = e.target.files?.[0];[m
[32m+[m[32m                    if (file) handleImageUpload(file);[m
[32m+[m[32m                }}[m
[32m+[m[32m            />[m
[32m+[m
[32m+[m[32m            <div ref={editorRef} />[m
[32m+[m
[32m+[m[32m            {picture && ([m
[32m+[m[32m                <div className="mt-4 flex justify-center">[m
[32m+[m[32m                    <img[m
[32m+[m[32m                        src={picture}[m
[32m+[m[32m                        alt="Thumbnail selecionada"[m
[32m+[m[32m                        className="max-h-48 rounded shadow"[m
[32m+[m[32m                    />[m
[32m+[m[32m                </div>[m
[32m+[m[32m            )}[m
[32m+[m[32m        </div>[m
[32m+[m[32m    );[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/src/app/favicon.ico b/src/app/favicon.ico[m
[1mdeleted file mode 100644[m
[1mindex 718d6fe..0000000[m
Binary files a/src/app/favicon.ico and /dev/null differ
[1mdiff --git a/src/app/futevolei/[id]/page.tsx b/src/app/futevolei/[id]/page.tsx[m
[1mnew file mode 100644[m
[1mindex 0000000..37133cc[m
[1m--- /dev/null[m
[1m+++ b/src/app/futevolei/[id]/page.tsx[m
[36m@@ -0,0 +1,25 @@[m
[32m+[m[32mimport prisma from "@/lib/prisma";[m
[32m+[m
[32m+[m[32masync function fetchPosts(id: string) {[m
[32m+[m[32m    const posts = await prisma.postfutevolei.findUnique({[m
[32m+[m[32m        where: {[m
[32m+[m[32m            id: id[m
[32m+[m[32m        }[m
[32m+