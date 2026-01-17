import psycopg2, csv, json

conn = psycopg2.connect(
    host="db", database="app", user="app", password="app"
)
cur = conn.cursor()

users = ["Ala","Ola","Jan","Kuba","Ewa"]
for u in users:
    cur.execute("INSERT INTO users(name) VALUES (%s)", (u,))
conn.commit()

with open("/output/users.csv","w") as f:
    csv.writer(f).writerows([["name"]] + [[u] for u in users])

with open("/output/data.json","w") as f:
    json.dump({"count": len(users)}, f)

with open("/output/seed.log","w") as f:
    f.write("Seed completed")

cur.close()
conn.close()