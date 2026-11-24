


#z1

CREATE OR REPLACE VIEW v_stacje AS
SELECT
    stacje.kod,
    stacje.nazwa AS stacja,
    miasta.nazwa AS miasto,
    stacje.typ_stacji,
    CONCAT(stacje.szerokosc, ',', stacje.dlugosc) AS wspolrzedne
FROM stacje 
JOIN miasta  ON miasta.id = stacje.miasto_id;

select * from v_stacje

# z2

CREATE OR REPLACE VIEW v_pomiary_dzienne AS
SELECT
    pomiary_dobowe.data,
    miasta.nazwa AS miasto,
    stacje.nazwa AS stacja,
    pomiary_dobowe.pm10
FROM pomiary_dobowe
JOIN stacje  ON stacje.kod = pomiary_dobowe.kod_stacji
JOIN miasta  ON miasta.id = stacje.miasto_id;

select * from v_pomiary_dzienne


#z3

CREATE OR REPLACE VIEW v_krakow_pogoda AS
SELECT
    pomiary_dobowe.data,
    stacje.nazwa AS stacja,
    pomiary_dobowe.pm10,
    pogoda_dobowa.temp_sr,
    pogoda_dobowa.opad,
    pogoda_dobowa_wiatr
  
FROM pomiary_dobowe
JOIN stacje  ON stacje.kod = pomiary_dobowe.kod_stacji
JOIN miasta ON miasta.id = stacje.miasto_id
JOIN pogoda_dobowa ON pogoda_dobowa.stacja_meteo = miasta.stacja_meteo
AND pogoda_dobowa.data = pomiary_dobowe.data
WHERE miasta.nazwa = 'Kraków';


#z4
