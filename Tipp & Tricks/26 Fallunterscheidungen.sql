-- Disclaimer:
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Es wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen steht der Autor gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- CASE WHEN, einfache Variante
DECLARE @v CHAR(1) = 'R';

SELECT   
      CASE @v  
         WHEN 'R' THEN 'Road'  
         WHEN 'M' THEN 'Mountain'  
         WHEN 'T' THEN 'Touring'  
         WHEN 'S' THEN 'Other sale items'  
         ELSE 'Not for sale'  
      END AS 'Gruppierung'
GO  

-- CASE WHEN, komplexe Variante
DECLARE @preis DECIMAL(18,2) = 299.99;

SELECT @preis, CASE   
         WHEN @preis < 100 THEN @preis 
         WHEN @preis < 250 THEN @preis * 0.95 -- 5% Rabatt  
         WHEN @preis < 500 THEN @Preis * 0.90 -- 10% Rabatt
         WHEN @preis < 1000 THEN @Preis * 0.85 -- 15% Rabatt
         ELSE @Preis * 0.80 -- 20% Rabatt 
      END AS 'Rabattiert';
GO  
  
-- IIF Ersten oder zweiten Wert nach Boolean ausw�hlen
SELECT IIF(DATENAME(HOUR, GETDATE()) < 12, 'Vormittags', 'Nachmittags');

-- CHOOSE Wert �ber Index ausw�hlen
DECLARE @v INT = 3;

SELECT CHOOSE(@v, 'I', 'II', 'III', 'IV', 'V');
GO

-- Ung�ltige Indizes erzeugen NULL
DECLARE @v INT = 99;

SELECT CHOOSE(@v, 'I', 'II', 'III', 'IV', 'V');
GO
