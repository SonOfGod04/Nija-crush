# Naija Crush 🇳🇬

A Nigerian-themed match-3 game with 250 missions. Each mission visits a different culture, from the Awori of Lagos to the Jenjo of Taraba, plus national celebrations. Every mission starts with a moral choice about honesty, integrity or responsibility.

- Steadily rising difficulty: goals, move counts, tile types and score targets grow with the mission number
- Special candies: 4-match makes a pepper blast, 5-match makes a jollof bomb
- 5 lives (one regenerates every 8 minutes) and three lifelines per mission
- Heart Fund side quests (virtual points for orphanage, recovery, scholarship, water and health causes)
- Leaderboard and Help Exchange between players (needs Supabase)
- Culture cards after each win. Groups with an empty fact in the `C` list show a respectful placeholder, so add real facts as you collect them.

Single file, no build step. Progress is saved in the browser.

## 1. Put it on GitHub
Create a repository and upload every file in this folder: `index.html`, `config.js`, `vercel.json`, `supabase.sql` and this README.

## 2. Deploy on Vercel (recommended)
Option A, from GitHub:
1. Sign in at vercel.com with GitHub.
2. Add New > Project, then import your repository.
3. Framework Preset: **Other**. Leave Build Command and Output Directory empty. Click Deploy.
4. Your game goes live at `https://<project-name>.vercel.app`. Every push to GitHub redeploys it.

Option B, from your computer:
1. Install Node.js, then run `npm i -g vercel`.
2. In this folder run `vercel`, answer the prompts, then `vercel --prod`.

## 3. Connect Supabase (leaderboard and Help Exchange)
1. In your Supabase project open SQL Editor, paste the contents of `supabase.sql` and run it.
2. Open Project Settings > API and copy the **anon public** key. Never use the `service_role` key.
3. Paste the key into `config.js`, commit and push. Vercel redeploys and the leaderboard and Help Exchange switch on.

## Alternative: GitHub Pages
Settings > Pages > `main` branch, root folder. The same files work there.

## Security note
The game keeps each player's points in their own browser, and the database policies are open to the public key so that players can post scores and gifts. A determined player could therefore cheat. That is fine for a friendly game. For a stricter version, add Supabase Auth and move gifting into a database function.

## Culture facts
Facts shown after each mission live in the `C` list in `index.html` (name|area|fact). Entries with an empty fact show a placeholder. Most facts come from the Nigerian Tourism Development Authority festival list and common knowledge; please have a member of each community review their entry before you promote the game.
