Q1: Who is the senior most employee based on job title?

select * from employee
ORDER BY levels desc
limit 1

Q2: Which countries have the most Invoices?

select * from invoice

select count(*) as c, billing_country
from invoice
group by billing_country
order by c desc 

Q3: What are top 3 values of total invoice?

select * from invoice

select total from invoice
order by total desc
limit 3 

Q4: Which city has the best customers?
    return both the city name & sum of al invoice tatals.

select * from invoice

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc

Q5: Who is the best customer spent most money?

select * from customer

select customer.customer_id, customer.first_name, customer.last_name,
sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1 

Q6: Write a query return the Artist name and total track count of top 10 rock band?

select * from track
select * from genre

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;

Q7: Return all track name song length longer than average song length
    Return name and milliseconds for each tarck & order by longest songs?
	
select * from track

select name,milliseconds
from track
where milliseconds > (
      select avg(milliseconds) as avg_track_lenght
	  from track)
order by milliseconds desc 

	  


