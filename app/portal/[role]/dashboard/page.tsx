'use client';
import { Activity, Users, BookOpen, MessageSquare, TrendingUp, Clock } from 'lucide-react';

export default function DashboardPage({ params }: { params: { role: string } }) {
  const role = params.role.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());

  const stats = [
    { label: 'Active Tasks', value: '12', icon: Activity, color: 'text-emerald-400' },
    { label: 'Team Members', value: '21', icon: Users, color: 'text-blue-400' },
    { label: 'Research Papers', value: '34', icon: BookOpen, color: 'text-purple-400' },
    { label: 'Forum Posts', value: '479', icon: MessageSquare, color: 'text-yellow-400' },
  ];

  const recentActivity = [
    { user: 'Dr. Amir Patel', action: 'completed research review', time: '2 min ago' },
    { user: 'James Chen', action: 'merged PR #234', time: '15 min ago' },
    { user: 'Dr. Layla Rahman', action: 'published blog post', time: '1 hour ago' },
  ];

  return (
    <div className="pt-16 min-h-screen bg-background-slate950">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-text-slate200 mb-2">{role} Dashboard</h1>
          <p className="text-text-grey">Welcome back! Here's your overview.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          {stats.map((stat, index) => (
            <div key={index} className="p-6 bg-background-slate900 border border-white/10 rounded-xl">
              <div className="flex items-center justify-between mb-4">
                <stat.icon className={`w-8 h-8 ${stat.color}`} />
                <TrendingUp className="w-5 h-5 text-emerald-400" />
              </div>
              <div className="text-3xl font-bold text-text-slate200 mb-1">{stat.value}</div>
              <div className="text-sm text-text-grey">{stat.label}</div>
            </div>
          ))}
        </div>

        <div className="bg-background-slate900 border border-white/10 rounded-xl p-6">
          <h2 className="text-xl font-bold text-text-slate200 mb-4">Recent Activity</h2>
          <div className="space-y-4">
            {recentActivity.map((item, index) => (
              <div key={index} className="flex items-center gap-4 p-4 bg-background-slate950 rounded-lg">
                <Clock className="w-5 h-5 text-text-grey" />
                <div className="flex-1">
                  <span className="text-text-slate200 font-medium">{item.user}</span>
                  <span className="text-text-grey"> {item.action}</span>
                </div>
                <span className="text-sm text-text-grey">{item.time}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
