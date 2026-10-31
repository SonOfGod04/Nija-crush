# Naija Crush 🇳🇬

A Nigerian-themed match-3 game with 250 missions. Each mission visits a different culture, from the Awori of Lagos to the Jenjo of Taraba, plus national celebrations. Every mission starts with a moral choice about honesty, integrity or responsibility.

- Steadily rising difficulty: goals, move counts, tile types and score targets grow with the mission number
- Special candies: 4-match makes a pepper blast, 5-match makes a jollof bomb
- 5 lives (one regenerates every 8 minutes) and three lifelines per mission
- Heart Fund side quests (virtual points for orphanage, recovery, scholarship, water and health causes)
- Leaderboard and Help Exchange between players (needs Supabase)
- Culture cards after each win. Groups with an empty fact in the `C` list show a respectful placeholder, so add real facts as you collect them.

Single file, no build step. Progress is saved in the browser.

## 1. Deploy on GitHub Pages
1. Create a repository and upload `index.html` and this README.
2. Settings > Pages > choose the `main` branch and root folder > Save.
3. The game is live at `https://<your-username>.github.io/<repo-name>/`.

## 2. Connect Supabase (leaderboard and Help Exchange)
1. In your Supabase project open SQL Editor, paste the contents of `supabase.sql` and run it.
2. Open Project Settings > API and copy the **anon public** key. Never use the `service_role` key in the game.
3. In `index.html`, find the line starting `const SB={url:` and paste the key between the empty quotes after `key:`.
4. Commit the change. The leaderboard and Help Exchange switch on.

## Security note
The game keeps each player's points in their own browser, and the database policies are open to the public key so that players can post scores and gifts. A determined player could therefore cheat. That is fine for a friendly game. For a stricter version, add Supabase Auth and move gifting into a database function.
