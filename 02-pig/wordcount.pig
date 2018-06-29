lines = LOAD '/user/<username>/datasets/gutenberg-small/*.txt' AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words) as cont;
ordered = ORDER wordcount BY cont DESC;
Top10 = LIMIT ordered 10;
STORE Top10 INTO ‘/user/<username>/top10words';
DUMP Top10;