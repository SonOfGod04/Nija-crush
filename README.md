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

## 3. Connect Supabase (accounts, leaderboard, Help Exchange)
1. In your Supabase project open SQL Editor, paste the contents of `supabase.sql` and run it. It is safe to run again later.
2. Open Project Settings > API and copy the **anon public** key. Never use the `service_role` key.
3. Paste the key into `config.js`, commit and push. Vercel redeploys.
4. Open Authentication > Providers and keep **Email** switched on. Under Authentication > URL Configuration set the Site URL to your Vercel address, so confirmation emails link back to the game.
5. Keep "Confirm email" on so each account needs a real inbox. Turn it off only while testing.

### How accounts work
- Players create an account with an email, a password and a unique nickname, or play as a guest (guests are not on the leaderboard or Help Exchange).
- Progress is saved to the account, so it follows the player to any device.
- Each player can only change their own rows, and only the receiver can claim a gift.
- Only one device can be signed in to an account at a time. Signing in elsewhere signs the older device out within about a minute.
- Nobody can stop a person from handing their password to a friend, but the one-device rule makes sharing awkward.
- Points and scores are still calculated in the browser, so a determined player could cheat. For a stricter game, move scoring and gifting into Supabase database functions.

## Alternative: GitHub Pages
Settings > Pages > `main` branch, root folder. The same files work there.

## Culture facts
Facts shown after each mission live in the `C` list in `index.html` (name|area|fact). Entries with an empty fact show a placeholder. Most facts come from the Nigerian Tourism Development Authority festival list and common knowledge; please have a member of each community review their entry before you promote the game.

Let's go!
