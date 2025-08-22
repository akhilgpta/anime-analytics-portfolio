# Anime Analytics Portfolio 🎥📊

## Overview  
This project analyzes trends in **anime releases, genres, ratings, and popularity** using real data sources.  
The goal is to demonstrate skills in **Excel, SQL (DuckDB), and Power BI**, while telling a clear data story recruiters and hiring managers can follow.  

---

## Dataset 📂  
- **Anime TV Series Dataset (1,200 entries)**  
  - Release years: 1960–2023  
  - Genres, studios, number of episodes  
  - Average ratings (0–10)  
  - Popularity counts (audience size)  

### Data Sources  
- **AniList API** → https://anilist.gitbook.io/anilist-apiv2-docs/  
- **MyAnimeList Community Data (via Kaggle, 2023)**  

Dataset is stored in [`/data/anime_tv_series_dataset.csv`](data/anime_tv_series_dataset.csv).  

---

## Tools Used 🛠️  
- **Excel** → Pivot tables & charts  
- **DuckDB (SQL)** → Quick queries on CSV data  
- **Power BI** → Interactive dashboard (ratings, genres, popularity)  
- **GitHub** → Portfolio hosting  

---

## Analysis & Visuals 📊  

### Excel  
- **Anime Releases by Year (1960–2023)**  
- **Average Ratings by Genre**  
- **Top 10 Most Popular Anime: Popularity vs Rating**  

👉 Charts exported to `/images/` and shown below:  
*(add your PNGs once exported)*  

---

### SQL (DuckDB)  
Queries included in [`/sql/`](sql/README.md).  

Example questions answered:  
- Which studios have the highest average ratings?  
- How have anime ratings changed across decades?  
- Which genres are both popular and highly rated?  

---

### Power BI  
Interactive dashboard showing:  
- Line chart: Anime releases over time  
- Bar chart: Ratings by genre  
- Scatter plot: Popularity vs ratings  

👉 PBIX file in [`/powerbi/`](powerbi/).  
👉 Screenshots exported to `/images/`.  

*(optional: add Power BI “Publish to Web” link here)*  

---

## How to Reproduce ⚙️  
1. Clone this repo.  
2. Open the dataset in `/data/`.  
3. Run the SQL queries in DuckDB or any SQL tool.  
4. Open the Power BI `.pbix` file to interact with the dashboard.  
5. Review charts directly in `/images/` if you don’t want to run tools.  

---

## Insights ✨  
- Anime production has grown significantly since the 1980s, with peaks in the 2010s.  
- **Genres like Drama and Mystery** tend to score higher than average.  
- Popularity doesn’t always mean high ratings — some highly watched shows are rated lower, while niche series achieve high scores.  
- Certain studios (e.g., Kyoto Animation, Madhouse, Wit Studio) consistently deliver strong ratings.  

---

## License 📜  
This project is for educational & portfolio purposes only. Data originates from **AniList API** and **MyAnimeList (via Kaggle)**.  

