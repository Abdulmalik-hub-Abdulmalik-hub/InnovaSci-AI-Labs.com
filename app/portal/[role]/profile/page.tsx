'use client';
import { User, Mail, Shield, Award, Calendar } from 'lucide-react';

const mockUser = {
  fullName: 'Ahmad Al-Farsi',
  email: 'admin@innovasci.com',
  role: 'System Administrator',
  avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200',
  bio: 'System Administrator with 15+ years of experience in enterprise infrastructure management.',
  qualification: 'MSc in Computer Science',
  achievements: ['Zero-downtime deployments', 'Security certification', 'AWS certified'],
  stats: { tasks: 12, completed: 8, pending: 4 },
};

export default function ProfilePage({ params }: { params: { role: string } }) {
  const role = params.role.replace(/-/g, '_').toUpperCase();

  return (
    <div className="pt-16 min-h-screen bg-background-slate950">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="grid lg:grid-cols-3 gap-8">
          <div className="lg:col-span-1">
            <div className="bg-background-slate900 border border-white/10 rounded-2xl p-6">
              <div className="text-center mb-6">
                <img src={mockUser.avatar} alt={mockUser.fullName} className="w-32 h-32 rounded-full mx-auto mb-4 object-cover" />
                <h1 className="text-2xl font-bold text-text-slate200">{mockUser.fullName}</h1>
                <p className="text-empirical-teal">{mockUser.role}</p>
              </div>
              <div className="space-y-4">
                <div className="flex items-center gap-3 text-text-grey">
                  <Mail className="w-5 h-5" />
                  <span>{mockUser.email}</span>
                </div>
                <div className="flex items-center gap-3 text-text-grey">
                  <Shield className="w-5 h-5" />
                  <span>{role}</span>
                </div>
              </div>
              <div className="mt-6 pt-6 border-t border-white/10">
                <h3 className="font-semibold text-text-slate200 mb-3">Achievements</h3>
                <div className="space-y-2">
                  {mockUser.achievements.map((a, i) => (
                    <div key={i} className="flex items-center gap-2 text-sm text-text-grey">
                      <Award className="w-4 h-4 text-empirical-teal" />
                      {a}
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>
          <div className="lg:col-span-2 space-y-6">
            <div className="bg-background-slate900 border border-white/10 rounded-2xl p-6">
              <h2 className="text-xl font-bold text-text-slate200 mb-4">About</h2>
              <p className="text-text-grey">{mockUser.bio}</p>
              <div className="mt-4">
                <h3 className="font-semibold text-text-slate200 mb-2">Qualification</h3>
                <p className="text-text-grey">{mockUser.qualification}</p>
              </div>
            </div>
            <div className="bg-background-slate900 border border-white/10 rounded-2xl p-6">
              <h2 className="text-xl font-bold text-text-slate200 mb-4">Activity Stats</h2>
              <div className="grid grid-cols-3 gap-4">
                <div className="text-center p-4 bg-background-slate950 rounded-xl">
                  <div className="text-3xl font-bold text-text-slate200">{mockUser.stats.tasks}</div>
                  <div className="text-sm text-text-grey">Total Tasks</div>
                </div>
                <div className="text-center p-4 bg-background-slate950 rounded-xl">
                  <div className="text-3xl font-bold text-empirical-teal">{mockUser.stats.completed}</div>
                  <div className="text-sm text-text-grey">Completed</div>
                </div>
                <div className="text-center p-4 bg-background-slate950 rounded-xl">
                  <div className="text-3xl font-bold text-yellow-400">{mockUser.stats.pending}</div>
                  <div className="text-sm text-text-grey">Pending</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
