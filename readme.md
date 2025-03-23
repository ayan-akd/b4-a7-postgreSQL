1. What is PostgreSQL?

    Ans: PostgreSQL হচ্ছে একটি শক্তিশালী ওপেন সোর্স রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম (RDBMS) যেটা SQL এবং JSON দুইতাই সাপোর্ট করে। 

2. What is the purpose of a database schema in PostgreSQL?

    Ans: একটি ডাটাবেস স্কিমা হলো একটি কন্টেইনার যা ডাটাবেসের টেবিল, ভিউ, ইনডেক্স, এবং অন্যান্য অবজেক্টগুলোর সংগঠিত কাঠামো নির্ধারণ করে। এটি ডাটাবেস ম্যানেজমেন্টকে সহজ করে।

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

    Ans: 
প্রাইমারি কী: এটি একটি টেবিলের এমন একটি কলাম বা কলামের সমষ্টি যা প্রতিটি রেকর্ডকে অনন্যভাবে চিহ্নিত করে।
ফরিজেন কী: এটি একটি টেবিলের কলাম যা অন্য টেবিলের প্রাইমারি কীকে রেফারেন্স করে এবং সম্পর্ক তৈরি করে।

4. What is the difference between the VARCHAR and CHAR data types?

    Ans:
VARCHAR: এটি পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং ধারণ করে, অর্থাৎ, এর দৈর্ঘ্য যেকোনো মান হতে পারে।
CHAR: এটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং ধারণ করে, এবং যদি স্ট্রিং ছোট হয়, তাহলে শূন্য জায়গা যোগ করা হয়।

5. Explain the purpose of the WHERE clause in a SELECT statement.

    Ans: WHERE ক্লজ ব্যবহৃত হয় নির্দিষ্ট শর্তে থাকা রেকর্ডগুলি নির্বাচন করার জন্য।

6. What are the LIMIT and OFFSET clauses used for?

    Ans:
LIMIT: এটি নির্দিষ্ট সংখ্যক রেকর্ড ফিরিয়ে আনে।
OFFSET: এটি রেকর্ডের কিছু সংখ্যক প্রথম অংশ বাদে পরবর্তী রেকর্ডগুলি ফিরিয়ে আনে।
7. How can you modify data using UPDATE statements?

    Ans: UPDATE স্টেটমেন্টের মাধ্যমে টেবিলের নির্দিষ্ট রেকর্ডগুলির মান পরিবর্তন করা যায়।
যেমনঃ UPDATE books SET price = 0

8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

    Ans: JOIN অপারেশন ব্যবহার করে একাধিক টেবিলের ডেটা একসাথে সংযুক্ত করা হয়। এটি সম্পর্কিত টেবিলগুলির মধ্যে সম্পর্ক তৈরি করে।
PostgreSQL বিভিন্ন JOIN সমর্থন করে, যেমনঃ
INNER JOIN – শুধুমাত্র মিলে যাওয়া রেকর্ড ফেরত দেয়।
LEFT JOIN – বাম টেবিলের সব রেকর্ড এবং ডান টেবিলের মিলে যাওয়া রেকর্ড ফেরত দেয়।
RIGHT JOIN – ডান টেবিলের সব রেকর্ড এবং বাম টেবিলের মিলে যাওয়া রেকর্ড ফেরত দেয়।

9. Explain the GROUP BY clause and its role in aggregation operations.

    Ans: GROUP BY ক্লজ ব্যবহার করে ডেটা গ্রুপ করা হয় এবং এরপর অ্যাগ্রিগেশন ফাংশন (যেমন COUNT(), SUM(), AVG()) ব্যাবহার করা হয়।

10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

    Ans: 
COUNT(): এটি রেকর্ডের সংখ্যা গণনা করে।
SUM(): এটি একটি কলামে মোট মান গণনা করে।
AVG(): এটি একটি কলামে গড় মান গণনা করে।
যেমনঃ
SELECT COUNT(*) FROM books;
SELECT SUM(price) FROM books;
SELECT AVG(price) FROM books;