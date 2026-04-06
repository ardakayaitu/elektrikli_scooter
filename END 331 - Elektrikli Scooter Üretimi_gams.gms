* ARDA KAYA – 070240733
* AHMETCAN UL – 070230048
* ALEYNA BAYSAL – 507251164

* --- 1. İNDİSLER ---
Set i seri /urban, pro, premium/
    j model /compact, standard, long-range/
    h hat /hat1, hat2, hat3, montaj, ozel/
    a ay /haziran, temmuz, agustos/
    m mal /aluminyum, kompozit, karbon/ ;
    
* --- 2. PARAMETRELER VE VERI TABLOLARI ---
Table sure(i,j,h) Scooter basina sureler (dk)
                  hat1 hat2 hat3 montaj ozel
urban.compact     1.5   1    0     10    0 
urban.standard     2    1    0     11    0 
urban.long-range  2.5   1    0     12    0
pro.compact        0    1    3     15    0
pro.standard       0    1    4     18    0
pro.long-range     0    1    5     20    0
premium.compact    0    0    3     20    50
premium.standard   0    0    4     25    60
premium.long-range 0    0    5     30    70 ;

Table malzeme(i,j,m) Scooter basina malzeme gereksinimi
                   aluminyum kompozit karbon
urban.compact          14       8       0
urban.standard         24       15      0
urban.long-range       30       24      0
pro.compact            0        0       22
pro.standard           0        0       40
pro.long-range         0        0       55
premium.compact        0        0       25
premium.standard       0        0       45
premium.long-range     0        0       60 ;

Table m_teslim(m,a) Malzeme stoklari
           haziran temmuz agustos
aluminyum  78000   75000   80000
kompozit   72000   60000   75000
karbon     210000  180000  190000 ;

Table talep(i,j,a) Ay basina talep miktarlari
                   haziran temmuz agustos
urban.compact       1500    2000   2500
urban.standard      3000    2400   2600
urban.long-range    200     400    300
pro.compact         800     800    1000 
pro.standard        3000    2600   2400
pro.long-range      200     600    400
premium.compact     50      70     80
premium.standard    300     280    240
premium.long-range  100     120    140 ;

Table eylul_talebi(i,j) Eylul ayi talep miktarlari
        compact standard long-range
urban     1050    1100      120
pro       350     1000      180     
premium   30      100       160 ;

Table kc(i,j,*) i serisi j modelinin kar ve ceza degerler
                   kar ceza
urban.compact      20   24
urban.standard     30   60
urban.long-range   40   120
pro.compact        50   36
pro.standard       80   96
pro.long-range     125  300
premium.compact    100  48
premium.standard   250  150
premium.long-range 325  390 ;

parameter toplam_adam_dk(i,j) Toplam is yuku ;
toplam_adam_dk(i,j) =
    (sure(i,j,'hat1') + sure(i,j,'hat2') + sure(i,j,'hat3')) * 2
    + sure(i,j,'montaj')
    + sure(i,j,'ozel') ;

parameter birim_hiz_maliyeti(i) i serisinin birim hiz maliyeti
/ urban 12, pro 15, premium 20 /;

* --- 3. KARAR DEGISKENLERI ---
positive variables
    x(i,j,a) a ayindaki i serisi j modelinden uretilen miktar
    y(i,j,a) a ayindaki i serisi j modelinin karsilanamayan talebi
    m_kalan(m,a) a ayi sonundaki malzeme miktari
    s(i,j,a) a ayindaki i serisi j modelinin kalan stogu
    satis(i,j,a) a ayindaki i serisi j modelinin satis miktari
    kar_var(i,j,a) toplam kar
    ceza_var(i,j,a) toplam ceza
    artis(i,a) i serisinin aylik uretim hizi artisi
    azalis(i,a) i serisinin aylik uretim hizi azalisi ;
    
variables
    z net kar
    toplam_satis_kari
    toplam_ceza_maliyeti
    toplam_stok_maliyeti
    toplam_hiz_maliyeti ;

* --- 4. KISIT VE DENKLEM TANIMLAMALARI ---
equations
    amac_fonksiyonu toplam kar - toplam ceza
    malzeme_dengesi(m,a) Her ay basina malzeme takibi
    stok_dengesi(i,j,a) i serisi j modelinin stok dengesi
    satis_sinir(i,j,a) i serisi j modelinin ust satis siniri
    talep_dengesi(i,j,a) i serisi j modelinin talep dengesi
    stok_hesabi stok denklemi
    hiz_dengesi(i,a) uretim hizi dengesi
    hiz_hesabi toplam hiz maliyeti hesabi
    kar_hesabi toplam satis kari hesabi
    ceza_hesabi toplam ceza hesabi
    eylul_sarti(i,j) Eylul ayi stok sarti
    isgucu_kapasitesi(a) Is gucu kapasitesi (dk)
    hat1_siniri(a) Hat 1 kullanim siniri (dk)
    hat2_siniri(a) Hat 2 kullanim siniri (dk)
    hat3_siniri(a) Hat 3 kullanim siniri (dk)
    urban_min(a) urban serisinin minimum uretim kotasi
    urban_max(a) urban serisinin maximum uretim kotasi
    pro_min(a) pro serisinin minimum uretim kotasi
    pro_max(a) pro serisinin maximum uretim kotasi
    premium_min(a) premium serisinin minimum uretim kotasi
    premium_max(a) premium serisinin maximum uretim kotasi
    compact_min(a) compact modelinin minimum uretim kotasi
    compact_max(a) compact modelinin maximum uretim kotasi
    standard_min(a) standard modelinin minimum uretim kotasi
    standard_max(a) standard modelinin maximum uretim kotasi
    longrange_min(a) long-range modelinin minimum uretim kotasi
    longrange_max(a) long-range modelinin maximum uretim kotasi ;

* --- 5. KISITLARIN MATEMATIKSEL MODELLENMESI ---
malzeme_dengesi(m,a).. m_kalan(m,a) =e= m_kalan(m,a-1)$(ord(a)>1) + m_teslim(m,a) - sum((i,j), malzeme(i,j,m) * x(i,j,a));

stok_dengesi(i,j,a).. s(i,j,a) =e= s(i,j,a-1)$(ord(a)>1) + x(i,j,a) - satis(i,j,a);

talep_dengesi(i,j,a).. satis(i,j,a) + y(i,j,a) =g= talep(i,j,a);

satis_sinir(i,j,a).. satis(i,j,a) =l= talep(i,j,a) * 1.10;

hiz_dengesi(i,a)$(ord(a)>1).. sum(j, x(i,j,a)) - sum(j, x(i,j,a-1)) =e= artis(i,a) - azalis(i,a);

eylul_sarti(i,j).. s(i,j,'agustos') =g= eylul_talebi(i,j) * 0.15;

isgucu_kapasitesi(a).. sum((i,j), toplam_adam_dk(i,j) * x(i,j,a)) =l= 245760;

* Hat Kapasite Sinirlari
hat1_siniri(a).. sum((i,j), sure(i,j,'hat1') * x(i,j,a)) =l= 9600;
hat2_siniri(a).. sum((i,j), sure(i,j,'hat2') * x(i,j,a)) =l= 9600;
hat3_siniri(a).. sum((i,j), sure(i,j,'hat3') * x(i,j,a)) =l= 19200;

* Seri Uretim Kotalari
urban_min(a).. sum(j, x('urban',j,a)) =g= sum((i,j), x(i,j,a)) * 0.20;
urban_max(a).. sum(j, x('urban',j,a)) =l= sum((i,j), x(i,j,a)) * 0.50;

pro_min(a).. sum(j, x('pro',j,a)) =g= sum((i,j), x(i,j,a)) * 0.40;
pro_max(a).. sum(j, x('pro',j,a)) =l= sum((i,j), x(i,j,a)) * 0.60;

premium_min(a).. sum(j, x('premium',j,a)) =g= sum((i,j), x(i,j,a)) * 0.10;
premium_max(a).. sum(j, x('premium',j,a)) =l= sum((i,j), x(i,j,a)) * 0.20;

* Model Uretim Kotalari
compact_min(a).. sum(i, x(i,'compact',a)) =g= sum((i,j), x(i,j,a)) * 0.20;
compact_max(a).. sum(i, x(i,'compact',a)) =l= sum((i,j), x(i,j,a)) * 0.35;

standard_min(a).. sum(i, x(i,'standard',a)) =g= sum((i,j), x(i,j,a)) * 0.40;
standard_max(a).. sum(i, x(i,'standard',a)) =l= sum((i,j), x(i,j,a)) * 0.70;

longrange_min(a).. sum(i, x(i,'long-range',a)) =g= sum((i,j), x(i,j,a)) * 0.05;
longrange_max(a).. sum(i, x(i,'long-range',a)) =l= sum((i,j), x(i,j,a)) * 0.15;

* --- 6. MALIYET HESAPLAMALARI VE AMAC FONKSIYONU ---
stok_hesabi.. toplam_stok_maliyeti =e= sum((i,j,a), s(i,j,a) * (kc(i,j,'kar') * 0.10));

hiz_hesabi.. toplam_hiz_maliyeti =e= sum((i,a), (artis(i,a) + azalis(i,a)) * birim_hiz_maliyeti(i));

kar_hesabi.. toplam_satis_kari =e= sum((i,j,a), satis(i,j,a) * kc(i,j,'kar'));

ceza_hesabi.. toplam_ceza_maliyeti =e= sum((i,j,a), y(i,j,a) * kc(i,j,'ceza'));

amac_fonksiyonu.. z =e= toplam_satis_kari - toplam_ceza_maliyeti - toplam_stok_maliyeti - toplam_hiz_maliyeti;

* --- 7. MODELIN COZULMESI VE RAPORLAMA ---
model scooter_planlama /all/;
solve scooter_planlama maximizing z using LP;

* Sonuclari GAMS .lst dosyasina ham formatta bastirma
display z.l, toplam_satis_kari.l, toplam_ceza_maliyeti.l, toplam_stok_maliyeti.l, toplam_hiz_maliyeti.l;
display x.l, satis.l, s.l, y.l, m_kalan.l, artis.l, azalis.l;