"use strict";(()=>{var e={};e.id=744,e.ids=[744],e.modules={399:e=>{e.exports=require("next/dist/compiled/next-server/app-page.runtime.prod.js")},517:e=>{e.exports=require("next/dist/compiled/next-server/app-route.runtime.prod.js")},6406:(e,r,t)=>{t.r(r),t.d(r,{originalPathname:()=>h,patchFetch:()=>m,requestAsyncStorage:()=>c,routeModule:()=>p,serverHooks:()=>l,staticGenerationAsyncStorage:()=>d});var a={};t.r(a),t.d(a,{POST:()=>u});var o=t(9303),s=t(8716),n=t(3131),i=t(7070);async function u(e){try{let{message:r}=await e.json();if(!r)return i.NextResponse.json({error:"Message is required"},{status:400});let t=`I understand you're asking about: "${r}". 

As Hakeem, I can help you learn more about our AI products, research capabilities, and educational solutions. Our team of experts is ready to assist you.

Would you like to:
• Learn about our products (AI Core, Research Suite, Learn Platform)?
• Explore our research capabilities?
• Discover our educational programs?

Feel free to ask any specific questions!`;return i.NextResponse.json({response:t})}catch(e){return console.error("Chat error:",e),i.NextResponse.json({response:"I encountered an issue. Please try again."},{status:200})}}let p=new o.AppRouteRouteModule({definition:{kind:s.x.APP_ROUTE,page:"/api/chat/route",pathname:"/api/chat",filename:"route",bundlePath:"app/api/chat/route"},resolvedPagePath:"/workspace/innovasci-ai-labs/app/api/chat/route.ts",nextConfigOutput:"",userland:a}),{requestAsyncStorage:c,staticGenerationAsyncStorage:d,serverHooks:l}=p,h="/api/chat/route";function m(){return(0,n.patchFetch)({serverHooks:l,staticGenerationAsyncStorage:d})}}};var r=require("../../../webpack-runtime.js");r.C(e);var t=e=>r(r.s=e),a=r.X(0,[276,972],()=>t(6406));module.exports=a})();