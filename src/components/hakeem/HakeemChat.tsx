'use client';
import { useState, useRef, useEffect } from 'react';
import { MessageCircle, X, Send, Bot, User } from 'lucide-react';

interface Message { id: string; role: 'user' | 'assistant'; content: string; }

export function HakeemChat() {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    if (isOpen && messages.length === 0) {
      setMessages([{ id: 'welcome', role: 'assistant', content: "Hello! I'm Hakeem, your AI assistant at InnovaSci AI Labs.\n\nI can help you with:\n• Information about our products and services\n• Research and scientific inquiries\n• Education and learning resources\n• General questions about AI and technology\n\nHow can I assist you today?" }]);
    }
  }, [isOpen]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!input.trim() || isLoading) return;

    const userMessage: Message = { id: Date.now().toString(), role: 'user', content: input.trim() };
    setMessages(prev => [...prev, userMessage]);
    setInput('');
    setIsLoading(true);

    try {
      const response = await fetch('/api/chat', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ message: input.trim() }) });
      const data = await response.json();
      setMessages(prev => [...prev, { id: (Date.now() + 1).toString(), role: 'assistant', content: data.response || 'I apologize, but I encountered an issue.' }]);
    } catch {
      setMessages(prev => [...prev, { id: (Date.now() + 1).toString(), role: 'assistant', content: 'I encountered an error. Please try again.' }]);
    }
    setIsLoading(false);
  };

  return (
    <div className="fixed bottom-4 right-4 z-50">
      {isOpen ? (
        <div className="w-96 h-[500px] bg-background-slate900 border border-white/20 rounded-2xl shadow-2xl flex flex-col overflow-hidden">
          <div className="bg-gradient-to-r from-science-purple to-brand-deepBlue p-4 flex items-center justify-between">
            <div className="flex items-center gap-3">
              <Bot className="w-8 h-8 text-white" />
              <div><h3 className="text-white font-semibold">Hakeem</h3><p className="text-white/70 text-xs">AI Assistant</p></div>
            </div>
            <button onClick={() => setIsOpen(false)} className="text-white/70 hover:text-white"><X className="w-6 h-6" /></button>
          </div>
          <div className="flex-1 overflow-y-auto p-4 space-y-4">
            {messages.map((message) => (
              <div key={message.id} className={`flex ${message.role === 'user' ? 'justify-end' : 'justify-start'}`}>
                <div className={`max-w-[80%] rounded-2xl px-4 py-3 ${message.role === 'user' ? 'bg-gradient-to-r from-science-purple to-brand-deepBlue text-white' : 'bg-background-slate800 text-text-slate200'}`}>
                  {message.role === 'assistant' && <Bot className="w-5 h-5 text-empirical-teal mb-1" />}
                  <p className="text-sm whitespace-pre-wrap">{message.content}</p>
                </div>
              </div>
            ))}
          </div>
          <form onSubmit={handleSubmit} className="p-4 border-t border-white/10 flex gap-2">
            <input type="text" value={input} onChange={(e) => setInput(e.target.value)} placeholder="Ask Hakeem..." className="flex-1 px-4 py-2 bg-background-slate950 border border-white/10 rounded-xl text-text-slate200" disabled={isLoading} />
            <button type="submit" disabled={isLoading || !input.trim()} className="px-4 py-2 bg-gradient-to-r from-science-purple to-brand-deepBlue text-white rounded-xl disabled:opacity-50"><Send className="w-5 h-5" /></button>
          </form>
        </div>
      ) : (
        <button onClick={() => setIsOpen(true)} className="w-16 h-16 bg-gradient-to-r from-science-purple to-brand-deepBlue rounded-full shadow-lg hover:scale-105 transition-all flex items-center justify-center">
          <MessageCircle className="w-8 h-8 text-white" />
        </button>
      )}
    </div>
  );
}
