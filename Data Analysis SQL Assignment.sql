1.	SELECT COUNT(*) From users
2.	SELECT COUNT(*) From transfers where send_amount_currency = ‘CFA’
3.	SELECT DISTINCT COUNT(*) From transfers where send_amount_currency = ‘CFA’
4.	SELECT COUNT(*) From agent_transactions WHERE EXTRACT(YEAR From when_created) = ‘2018’ ORDER BY EXTRACT(MONTH From when_created)
5.	SELECT
(select count(*) from (SELECT * from agent_transactions  GROUP by agent_id having sum(amount)>0)) as net_withdrawers,
(select count(*) from (select * from agent_transactions  GROUP by agent_id having sum(amount)<0)) as net_depositors where when_created > CURRENT_DATE - 7;
6. 	CREATE TABLE atx_volume_city_summary(
	atx_id integer PRIMARY KEY,
	amount numeric NOT NULL,
	city text NOT NULL,
	country text NOT NULL,
	volume integer,
	when_created timestamp without time zone NOT NULL);

--if the volume is the total amount--
	select sum(abs(amount)) from atx_volume_city_summary group by city where when_created > CURRENT_DATE - 7;

7. select sum(abs(amount)) from atx_volume_city_summary group by country where when_created > CURRENT_DATE - 7;

8. CREATE TABLE send_volume_by_country_and_kind(
	atx_id integer PRIMARY KEY,
	send_amount_scalar numeric NOT NULL,
	city text NOT NULL,
	country text NOT NULL,
	kind text NOT NULL,
	volume integer,
	when_created timestamp without time zone NOT NULL);

	select sum(abs(send_amount_scalar)) from send_volume_by_country_and_kind group by country and kind where when_created > CURRENT_DATE - 7;


9. ALTER TABLE send_volume_by_country_and_kind
ADD COLUMN transaction_count_by_country integer,
ADD COLUMN transaction_count_by_transfer_kind integer,
ADD COLUMN number_of_unique_senders_by_country integer,
ADD COLUMN number_of_unique_senders_by_transfer_kind integer;


10. SELECT source_wallet_id, send_amount_scalar from transfers where send_amount_currency = 'CFA' and send_amount_scalar > 10,000,000 ORDER BY EXTRACT(MONTH From when_created);
