export const OPTIONS = ['Inbox', 'Today', 'Projects', 'Completed', 'Trash', 'DEV'] as const;
export type Option = typeof OPTIONS[number];
