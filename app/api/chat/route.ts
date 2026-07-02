import { NextRequest, NextResponse } from 'next/server';

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { message } = body;

    if (!message) {
      return NextResponse.json({ error: 'Message is required' }, { status: 400 });
    }

    const context = `You are Hakeem, the AI assistant for InnovaSci AI Labs.
We specialize in AI infrastructure, scientific research, and EdTech solutions.
Our products include InnovaSci AI Core, Research Suite, and Learn Platform.`;

    const responseText = `I understand you're asking about: "${message}". 

As Hakeem, I can help you learn more about our AI products, research capabilities, and educational solutions. Our team of experts is ready to assist you.

Would you like to:
• Learn about our products (AI Core, Research Suite, Learn Platform)?
• Explore our research capabilities?
• Discover our educational programs?

Feel free to ask any specific questions!`;

    return NextResponse.json({ response: responseText });
  } catch (error) {
    console.error('Chat error:', error);
    return NextResponse.json({ response: 'I encountered an issue. Please try again.' }, { status: 200 });
  }
}
