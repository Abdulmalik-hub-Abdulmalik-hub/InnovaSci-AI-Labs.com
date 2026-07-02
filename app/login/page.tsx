'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { Eye, EyeOff, Shield, User, Loader2 } from 'lucide-react';

const devCredentials = [
  { role: 'System Administrator', email: 'admin@innovasci.com', color: 'from-red-500 to-red-600' },
  { role: 'CEO', email: 'ceo@innovasci.com', color: 'from-purple-500 to-purple-600' },
  { role: 'CTO', email: 'cto@innovasci.com', color: 'from-blue-500 to-blue-600' },
  { role: 'CSO (Research Director)', email: 'cso@innovasci.com', color: 'from-green-500 to-green-600' },
  { role: 'CPO (Head of EdTech)', email: 'cpo@innovasci.com', color: 'from-yellow-500 to-yellow-600' },
  { role: 'CFO', email: 'cfo@innovasci.com', color: 'from-pink-500 to-pink-600' },
  { role: 'VP of Engineering', email: 'vpe@innovasci.com', color: 'from-indigo-500 to-indigo-600' },
  { role: 'Principal AI/ML Researcher', email: 'airesearcher@innovasci.com', color: 'from-violet-500 to-violet-600' },
  { role: 'Senior Full Stack Engineer', email: 'fullstack@innovasci.com', color: 'from-emerald-500 to-emerald-600' },
  { role: 'Senior UI/UX Designer', email: 'designer@innovasci.com', color: 'from-amber-500 to-amber-600' },
];

export default function LoginPage() {
  const router = useRouter();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState('');

  const handleQuickLogin = async (credEmail: string) => {
    setIsLoading(true);
    setError('');
    try {
      const response = await fetch('/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: credEmail, password: 'innovasci123' }),
      });
      const data = await response.json();
      if (response.ok) {
        document.cookie = `auth_token=${data.token}; path=/; max-age=${60 * 60 * 24 * 7}`;
        document.cookie = `user_role=${data.user.role}; path=/; max-age=${60 * 60 * 24 * 7}`;
        router.push(`/portal/profile`);
      } else {
        setError(data.error || 'Login failed');
      }
    } catch {
      setError('An error occurred');
    }
    setIsLoading(false);
  };

  return (
    <div className="min-h-screen pt-16 bg-background-slate950">
      <div className="max-w-7xl mx-auto px-4 py-12">
        <div className="grid lg:grid-cols-2 gap-12">
          <div className="flex items-center justify-center">
            <div className="w-full max-w-md">
              <div className="text-center mb-8">
                <div className="inline-flex items-center justify-center w-16 h-16 rounded-2xl bg-gradient-to-br from-science-purple to-empirical-teal mb-4">
                  <Shield className="w-8 h-8 text-white" />
                </div>
                <h1 className="text-3xl font-bold text-text-slate200 mb-2">Welcome Back</h1>
                <p className="text-text-grey">Sign in to access your portal</p>
              </div>
              <div className="space-y-4">
                <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="Email" className="w-full px-4 py-3 bg-background-slate900 border border-white/10 rounded-xl text-text-slate200" />
                <div className="relative">
                  <input type={showPassword ? 'text' : 'password'} value={password} onChange={(e) => setPassword(e.target.value)} placeholder="Password" className="w-full px-4 py-3 bg-background-slate900 border border-white/10 rounded-xl text-text-slate200 pr-12" />
                  <button type="button" onClick={() => setShowPassword(!showPassword)} className="absolute right-4 top-1/2 -translate-y-1/2 text-text-grey">{showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}</button>
                </div>
                {error && <div className="p-4 bg-red-500/10 border border-red-500/20 text-red-400 text-sm rounded-xl">{error}</div>}
                <button disabled={isLoading} className="w-full py-3 bg-gradient-to-r from-science-purple to-brand-deepBlue text-white rounded-xl font-semibold disabled:opacity-50 flex items-center justify-center gap-2">
                  {isLoading ? <><Loader2 className="w-5 h-5 animate-spin" /> Signing In...</> : 'Sign In'}
                </button>
              </div>
              <p className="mt-6 text-center text-text-grey text-sm">Default password: <code className="text-empirical-teal">innovasci123</code></p>
            </div>
          </div>
          <div>
            <div className="bg-background-slate900 border border-white/10 rounded-2xl p-6">
              <div className="flex items-center gap-3 mb-6">
                <User className="w-5 h-5 text-empirical-teal" />
                <h2 className="text-xl font-bold text-text-slate200">Dev Credentials Selector</h2>
              </div>
              <p className="text-text-grey text-sm mb-6">Click any role below for instant one-click login.</p>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 max-h-[400px] overflow-y-auto pr-2">
                {devCredentials.map((cred, index) => (
                  <button key={index} onClick={() => handleQuickLogin(cred.email)} disabled={isLoading} className={`p-3 rounded-xl bg-gradient-to-r ${cred.color} bg-opacity-10 border border-transparent hover:border-white/20 transition-all text-left disabled:opacity-50`}>
                    <div className="text-sm font-medium text-text-slate200">{cred.role}</div>
                    <div className="text-xs text-text-grey truncate">{cred.email}</div>
                  </button>
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
