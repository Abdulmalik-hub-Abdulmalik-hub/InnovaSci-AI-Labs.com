'use client';
import { useState } from 'react';
import { Plus, Activity, CheckCircle, Clock, AlertCircle } from 'lucide-react';

const initialTasks = {
  TODO: [
    { id: '1', title: 'Design Dashboard Components', assignee: 'James Chen', priority: 'medium', due: 'Dec 15' },
    { id: '2', title: 'Write API Documentation', assignee: 'Ahmed Hassan', priority: 'low', due: 'Dec 20' },
  ],
  IN_PROGRESS: [
    { id: '3', title: 'Implement User Authentication', assignee: 'James Chen', priority: 'high', due: 'Dec 12' },
    { id: '4', title: 'MMLU Evaluation Analysis', assignee: 'Dr. Amir Patel', priority: 'high', due: 'Dec 10' },
  ],
  IN_REVIEW: [
    { id: '5', title: 'Set Up CI/CD Pipeline', assignee: 'James Chen', priority: 'high', due: 'Dec 8' },
  ],
  DONE: [
    { id: '6', title: 'Database Migration Scripts', assignee: 'James Chen', priority: 'high', due: 'Dec 5' },
    { id: '7', title: 'Schema Design Review', assignee: 'Dr. Layla Rahman', priority: 'medium', due: 'Dec 4' },
  ],
};

const recentActivity = [
  { user: 'Dr. Amir Patel', action: 'completed', task: 'MMLU Evaluation', time: '2 min ago' },
  { user: 'James Chen', action: 'moved', task: 'CI/CD Pipeline to IN_REVIEW', time: '15 min ago' },
  { user: 'Dr. Layla Rahman', action: 'created', task: 'Research Paper Draft', time: '1 hour ago' },
  { user: 'Ahmed Hassan', action: 'completed', task: 'API Integration', time: '2 hours ago' },
];

export default function WorkspacePage() {
  const [tasks] = useState(initialTasks);

  return (
    <div className="pt-16 min-h-screen bg-background-slate950">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="flex items-center justify-between mb-8">
          <div>
            <h1 className="text-3xl font-bold text-text-slate200 font-serif">Team Workspace</h1>
            <p className="text-text-grey">Manage tasks and collaborate with your team</p>
          </div>
          <button className="flex items-center gap-2 px-4 py-2 bg-gradient-to-r from-science-purple to-brand-deepBlue text-white rounded-lg hover:opacity-90 text-sm font-medium">
            <Plus className="w-4 h-4" /> New Task
          </button>
        </div>

        <div className="grid lg:grid-cols-4 gap-6 mb-8">
          {Object.entries(tasks).map(([status, statusTasks]) => (
            <div key={status} className="bg-background-slate900/50 rounded-xl p-4 border border-white/5">
              <div className="flex items-center justify-between mb-4">
                <h3 className="font-semibold text-text-slate200">{status.replace('_', ' ')}</h3>
                <span className="px-2 py-0.5 bg-white/10 text-text-grey text-xs rounded-full">{statusTasks.length}</span>
              </div>
              <div className="space-y-3">
                {statusTasks.map((task) => (
                  <div key={task.id} className="p-4 bg-background-slate900 border border-white/10 rounded-xl">
                    <div className="flex items-start justify-between mb-3">
                      <span className={`w-2 h-2 rounded-full mt-1.5 ${task.priority === 'high' ? 'bg-red-500' : task.priority === 'medium' ? 'bg-yellow-500' : 'bg-blue-500'}`} />
                      <span className="text-xs text-text-grey">{task.due}</span>
                    </div>
                    <h4 className="font-medium text-text-slate200 mb-2">{task.title}</h4>
                    <div className="flex items-center justify-between">
                      <span className="text-xs text-text-grey">Assigned to {task.assignee}</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>

        <div className="mt-8 p-6 bg-background-slate900 border border-white/10 rounded-xl">
          <h3 className="font-semibold text-text-slate200 mb-4 flex items-center gap-2">
            <Activity className="w-5 h-5 text-empirical-teal" /> Recent Activity
          </h3>
          <div className="space-y-3">
            {recentActivity.map((activity, index) => (
              <div key={index} className="flex items-center gap-4 p-3 bg-background-slate950 rounded-lg">
                <div className="w-2 h-2 rounded-full bg-empirical-teal" />
                <div className="flex-1">
                  <span className="text-text-slate200 font-medium">{activity.user}</span>
                  <span className="text-text-grey"> {activity.action} </span>
                  <span className="text-empirical-teal">{activity.task}</span>
                </div>
                <span className="text-xs text-text-grey">{activity.time}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
