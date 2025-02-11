PGDMP      (                |            aulasSoulcode    16.3    16.3 >               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16397    aulasSoulcode    DATABASE     �   CREATE DATABASE "aulasSoulcode" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "aulasSoulcode";
                postgres    false            �            1259    16501    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(60) NOT NULL,
    email character varying(30) NOT NULL,
    telefone character varying(20) NOT NULL,
    idade integer NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16500    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    226                       0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    225            �            1259    16547    itens    TABLE     �   CREATE TABLE public.itens (
    id integer NOT NULL,
    codigo_produto integer NOT NULL,
    id_cliente integer NOT NULL,
    quantidade numeric(10,2) NOT NULL
);
    DROP TABLE public.itens;
       public         heap    postgres    false            �            1259    16515    produtos    TABLE     �   CREATE TABLE public.produtos (
    codigo integer NOT NULL,
    nome character varying(60) NOT NULL,
    preco numeric(10,2) NOT NULL,
    quantidade numeric(10,2) NOT NULL
);
    DROP TABLE public.produtos;
       public         heap    postgres    false            �            1259    16563    consulta_completa    VIEW     C  CREATE VIEW public.consulta_completa AS
 SELECT itens.id_cliente AS cd_cliente,
    itens.quantidade,
    produtos.nome AS produto,
    clientes.nome AS cliente
   FROM ((public.itens
     JOIN public.produtos ON ((itens.codigo_produto = produtos.codigo)))
     JOIN public.clientes ON ((itens.id_cliente = clientes.id)));
 $   DROP VIEW public.consulta_completa;
       public          postgres    false    226    226    228    228    230    230    230            �            1259    16413    departamento    TABLE     t   CREATE TABLE public.departamento (
    num_depto integer NOT NULL,
    nome_depto character varying(60) NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false            �            1259    16412    departamento_num_depto_seq    SEQUENCE     �   CREATE SEQUENCE public.departamento_num_depto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.departamento_num_depto_seq;
       public          postgres    false    216                       0    0    departamento_num_depto_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.departamento_num_depto_seq OWNED BY public.departamento.num_depto;
          public          postgres    false    215            �            1259    16420 	   empregado    TABLE     �   CREATE TABLE public.empregado (
    matricula integer NOT NULL,
    nome_empregado character varying(50) NOT NULL,
    salario numeric(10,2),
    num_depto integer
);
    DROP TABLE public.empregado;
       public         heap    postgres    false            �            1259    16419    empregado_matricula_seq    SEQUENCE     �   CREATE SEQUENCE public.empregado_matricula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.empregado_matricula_seq;
       public          postgres    false    218                       0    0    empregado_matricula_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.empregado_matricula_seq OWNED BY public.empregado.matricula;
          public          postgres    false    217            �            1259    16546    itens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.itens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.itens_id_seq;
       public          postgres    false    230                       0    0    itens_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.itens_id_seq OWNED BY public.itens.id;
          public          postgres    false    229            �            1259    16514    produtos_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.produtos_codigo_seq;
       public          postgres    false    228                       0    0    produtos_codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.produtos_codigo_seq OWNED BY public.produtos.codigo;
          public          postgres    false    227            �            1259    16452    projeto    TABLE     �   CREATE TABLE public.projeto (
    num_proj integer NOT NULL,
    nome_projeto character varying(100) NOT NULL,
    lugar character varying(40) NOT NULL
);
    DROP TABLE public.projeto;
       public         heap    postgres    false            �            1259    16451    projeto_num_proj_seq    SEQUENCE     �   CREATE SEQUENCE public.projeto_num_proj_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.projeto_num_proj_seq;
       public          postgres    false    220                       0    0    projeto_num_proj_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.projeto_num_proj_seq OWNED BY public.projeto.num_proj;
          public          postgres    false    219            �            1259    16577    saldo    VIEW     �  CREATE VIEW public.saldo AS
 SELECT produtos.nome AS produto,
    produtos.quantidade AS quant_est,
    itens.quantidade AS quant_vend,
    sum((produtos.quantidade - itens.quantidade)) AS saldo
   FROM ((public.itens
     JOIN public.produtos ON ((itens.codigo_produto = produtos.codigo)))
     JOIN public.clientes ON ((itens.id_cliente = clientes.id)))
  GROUP BY itens.quantidade, produtos.nome, produtos.quantidade;
    DROP VIEW public.saldo;
       public          postgres    false    228    228    228    230    230    226    230            �            1259    16458    trabalha    TABLE     �   CREATE TABLE public.trabalha (
    mat_empregado integer NOT NULL,
    num_projeto integer NOT NULL,
    horas character varying(10)
);
    DROP TABLE public.trabalha;
       public         heap    postgres    false            �            1259    16491    view_empregado_departamento    VIEW     J  CREATE VIEW public.view_empregado_departamento AS
 SELECT d.num_depto,
    d.nome_depto,
    count(e.matricula) AS quantidade_empregados,
    round(sum(e.salario), 2) AS soma_salarios,
    round(avg(e.salario), 2) AS media_salarial,
    ( SELECT round(sum(empregado.salario), 2) AS round
           FROM public.empregado) AS soma_total_salarios,
    ( SELECT count(empregado.matricula) AS count
           FROM public.empregado) AS total_empregados
   FROM (public.departamento d
     LEFT JOIN public.empregado e ON ((d.num_depto = e.num_depto)))
  GROUP BY d.num_depto, d.nome_depto;
 .   DROP VIEW public.view_empregado_departamento;
       public          postgres    false    218    218    216    216    218            �            1259    16496     view_total_salarios_funcionarios    VIEW     �   CREATE VIEW public.view_total_salarios_funcionarios AS
 SELECT round(sum(salario), 2) AS total_salarios,
    count(matricula) AS total_funcionarios,
    round(avg(salario), 2) AS media_salarial
   FROM public.empregado;
 3   DROP VIEW public.view_total_salarios_funcionarios;
       public          postgres    false    218    218            �            1259    16487    visao_usuario    VIEW     �   CREATE VIEW public.visao_usuario AS
 SELECT e.matricula,
    e.nome_empregado,
    e.salario,
    d.nome_depto
   FROM (public.empregado e
     JOIN public.departamento d ON ((e.num_depto = d.num_depto)));
     DROP VIEW public.visao_usuario;
       public          postgres    false    216    218    218    218    218    216            N           2604    16504    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            K           2604    16416    departamento num_depto    DEFAULT     �   ALTER TABLE ONLY public.departamento ALTER COLUMN num_depto SET DEFAULT nextval('public.departamento_num_depto_seq'::regclass);
 E   ALTER TABLE public.departamento ALTER COLUMN num_depto DROP DEFAULT;
       public          postgres    false    216    215    216            L           2604    16423    empregado matricula    DEFAULT     z   ALTER TABLE ONLY public.empregado ALTER COLUMN matricula SET DEFAULT nextval('public.empregado_matricula_seq'::regclass);
 B   ALTER TABLE public.empregado ALTER COLUMN matricula DROP DEFAULT;
       public          postgres    false    218    217    218            P           2604    16550    itens id    DEFAULT     d   ALTER TABLE ONLY public.itens ALTER COLUMN id SET DEFAULT nextval('public.itens_id_seq'::regclass);
 7   ALTER TABLE public.itens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            O           2604    16518    produtos codigo    DEFAULT     r   ALTER TABLE ONLY public.produtos ALTER COLUMN codigo SET DEFAULT nextval('public.produtos_codigo_seq'::regclass);
 >   ALTER TABLE public.produtos ALTER COLUMN codigo DROP DEFAULT;
       public          postgres    false    228    227    228            M           2604    16455    projeto num_proj    DEFAULT     t   ALTER TABLE ONLY public.projeto ALTER COLUMN num_proj SET DEFAULT nextval('public.projeto_num_proj_seq'::regclass);
 ?   ALTER TABLE public.projeto ALTER COLUMN num_proj DROP DEFAULT;
       public          postgres    false    219    220    220                      0    16501    clientes 
   TABLE DATA           D   COPY public.clientes (id, nome, email, telefone, idade) FROM stdin;
    public          postgres    false    226   �J       �          0    16413    departamento 
   TABLE DATA           =   COPY public.departamento (num_depto, nome_depto) FROM stdin;
    public          postgres    false    216   �K                 0    16420 	   empregado 
   TABLE DATA           R   COPY public.empregado (matricula, nome_empregado, salario, num_depto) FROM stdin;
    public          postgres    false    218   N       
          0    16547    itens 
   TABLE DATA           K   COPY public.itens (id, codigo_produto, id_cliente, quantidade) FROM stdin;
    public          postgres    false    230   	�                 0    16515    produtos 
   TABLE DATA           C   COPY public.produtos (codigo, nome, preco, quantidade) FROM stdin;
    public          postgres    false    228   b�                 0    16452    projeto 
   TABLE DATA           @   COPY public.projeto (num_proj, nome_projeto, lugar) FROM stdin;
    public          postgres    false    220   Ü                 0    16458    trabalha 
   TABLE DATA           E   COPY public.trabalha (mat_empregado, num_projeto, horas) FROM stdin;
    public          postgres    false    221   �                  0    0    clientes_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clientes_id_seq', 11, true);
          public          postgres    false    225                       0    0    departamento_num_depto_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.departamento_num_depto_seq', 52, true);
          public          postgres    false    215                       0    0    empregado_matricula_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.empregado_matricula_seq', 1415, true);
          public          postgres    false    217                       0    0    itens_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.itens_id_seq', 15, true);
          public          postgres    false    229                       0    0    produtos_codigo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.produtos_codigo_seq', 4, true);
          public          postgres    false    227                       0    0    projeto_num_proj_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.projeto_num_proj_seq', 4, true);
          public          postgres    false    219            `           2606    16520    produtos codigo_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT codigo_pk PRIMARY KEY (codigo);
 <   ALTER TABLE ONLY public.produtos DROP CONSTRAINT codigo_pk;
       public            postgres    false    228            R           2606    16418    departamento departamento_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pk PRIMARY KEY (num_depto);
 F   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pk;
       public            postgres    false    216            T           2606    16449    departamento depto_unico 
   CONSTRAINT     Y   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT depto_unico UNIQUE (nome_depto);
 B   ALTER TABLE ONLY public.departamento DROP CONSTRAINT depto_unico;
       public            postgres    false    216            V           2606    16425    empregado empregado_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.empregado
    ADD CONSTRAINT empregado_pk PRIMARY KEY (matricula);
 @   ALTER TABLE ONLY public.empregado DROP CONSTRAINT empregado_pk;
       public            postgres    false    218            \           2606    16506    clientes id_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.clientes DROP CONSTRAINT id_pk;
       public            postgres    false    226            d           2606    16552    itens itens_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.itens
    ADD CONSTRAINT itens_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.itens DROP CONSTRAINT itens_pkey;
       public            postgres    false    230            ^           2606    16583    clientes nome_data 
   CONSTRAINT     X   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT nome_data UNIQUE (email, telefone);
 <   ALTER TABLE ONLY public.clientes DROP CONSTRAINT nome_data;
       public            postgres    false    226    226            b           2606    16585    produtos prod_uniq 
   CONSTRAINT     M   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT prod_uniq UNIQUE (nome);
 <   ALTER TABLE ONLY public.produtos DROP CONSTRAINT prod_uniq;
       public            postgres    false    228            X           2606    16457    projeto projeto_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.projeto
    ADD CONSTRAINT projeto_pk PRIMARY KEY (num_proj);
 <   ALTER TABLE ONLY public.projeto DROP CONSTRAINT projeto_pk;
       public            postgres    false    220            Z           2606    16462    trabalha trabalha_emp_proj_pk 
   CONSTRAINT     s   ALTER TABLE ONLY public.trabalha
    ADD CONSTRAINT trabalha_emp_proj_pk PRIMARY KEY (mat_empregado, num_projeto);
 G   ALTER TABLE ONLY public.trabalha DROP CONSTRAINT trabalha_emp_proj_pk;
       public            postgres    false    221    221            e           2606    16426    empregado empreg_depto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.empregado
    ADD CONSTRAINT empreg_depto_fk FOREIGN KEY (num_depto) REFERENCES public.departamento(num_depto);
 C   ALTER TABLE ONLY public.empregado DROP CONSTRAINT empreg_depto_fk;
       public          postgres    false    218    4690    216            h           2606    16553    itens itens_codigo_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens
    ADD CONSTRAINT itens_codigo_produto_fkey FOREIGN KEY (codigo_produto) REFERENCES public.produtos(codigo);
 I   ALTER TABLE ONLY public.itens DROP CONSTRAINT itens_codigo_produto_fkey;
       public          postgres    false    4704    228    230            i           2606    16558    itens itens_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens
    ADD CONSTRAINT itens_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);
 E   ALTER TABLE ONLY public.itens DROP CONSTRAINT itens_id_cliente_fkey;
       public          postgres    false    4700    230    226            f           2606    16463    trabalha trabalha_empregado_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabalha
    ADD CONSTRAINT trabalha_empregado_fk FOREIGN KEY (mat_empregado) REFERENCES public.empregado(matricula);
 H   ALTER TABLE ONLY public.trabalha DROP CONSTRAINT trabalha_empregado_fk;
       public          postgres    false    218    221    4694            g           2606    16468    trabalha trabalha_projeto_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabalha
    ADD CONSTRAINT trabalha_projeto_fk FOREIGN KEY (num_projeto) REFERENCES public.projeto(num_proj);
 F   ALTER TABLE ONLY public.trabalha DROP CONSTRAINT trabalha_projeto_fk;
       public          postgres    false    4696    220    221               �   x�mϱ�0����:H���i�lj�\
&�	�����I�n������VI)���Ī�&at��OK��8�]�v�].��9�"��"%�� �~t~�`��c�\oH}5Z�(�� �E9f 2&�d��J�mֺ�+y���1���oJ�O�n ^�~�f+���)c��(B�      �   O  x�eRKn�0]S��,Z�?�[r,����r$��ޢG�"H�ٵ�^�+eO�4ىz�<����Tp��KgjI,FӀ�������'��� ��Ƃ%Q4{8��i���9@�ezBS�5�Ph�)��QZ2e5GA'�u~�-NO�O_�>�>`�Q[4
J�#;�h�p3�0��0=gV�c�M��v�I�{�#��ލ|!�$KE�f����C�o�ۈҮ�`9��ǁgz�*�>+�����䌙LU=�(qNlr@��n'��=��p��3�pn�tSVa�yO�f�?������门�95���k��t��2�%8�MטT[Sg�eH$K���S�M�P4u=ꞗ鷰��)>Qe}/Ҫ�d�L��ޡ��¾P�j�����w0�|���o�Ԇ!���-��Z1����*��ڨ�YW�M9�,�R s+X��������_����[*�ϗ��ފU��i���6��ɇ�M�f�������V�0���Zۛb��8�'��y��s�C%k%k���_XJ��AèM���f������6%$.V�Z�j5 {g6�@,�Z���|�b��25            x�u��v�ʶ%hc�c]�aR�T�^WTf�٣��H��H�@R�L�V5�q���m�G��?�s� @(�.'G-��s=#�n��w�������l�����x��oә�����{�t5��(2or;��'_�'���շ����K���0Ƚ�����̟��<������(��?2����j�_Ln'�����f�����}����y��Ý?���6��p���w:�<>\������W--�.'�W�k��n�8���H��k<y6��w�W�_�ɱ=�c�ar1�������dX�ڷzq�UIt$���׳�̟Mn�f^��f��׺������_��[�8?�$�N����xĿ���H3Xԛ+,��a��󝗄G���ɿ�^c��@�oX�3n����(=�^�?�m�_����s�шyW�����v�>6Qc��?��;��:��W�E�ɻW��Ļ��߀i��,^��)^���~��S�I���)W���v�%����^�[�w7X��?I3�����x��LE��ܦߑifx`wS�[�u��s�ਯx�ow=���y��G]ܳM���ػ�r����Gr�=Lo'���j2���0�/�tډ@>�f�������3��:yx�;
��ƛ]��am&7��pD�=��ʒ#-	�o��)Eg�������M"���v��C#�F��ܲ�+E�񺏟��AW�#24Ӎ��I�𥤥����|�;��G�#R�U�"�����h�����Fq{�^�NF�=|,1�Sϟ=�:�C/:!EzN��Ы
Q�V�Ï�KR|�X�z��!�=��A��QM��ȤB9M�n%5�VF����Ƈ��z�-�D�_�^1����.�'߮����4;�ᰯ�H΂Nh�~�͈H����4}��Y�a���ƏF(��^)�o��4����w��BGdi��P�g�ILG�̻��^�g`*{���HO��3|.������aX����^�����CI
����dو�pX��[��XF��߃����]�N�zc�ܫ%� x_�~�7��A�:��>�Gn:�߫�hD�����Ȑn�ʻ_�xtk�v���BM�hP9Xĸ�蝝IF$g�t����C#h ��{f6�f9�����ǒ���5�S�7�hѻյ#����ʤG����A�m8k���*��6��{����l2�ſ�����������`q>�%�B�ܿ�ܚ�#�OG�#�>7�x�nu��#Z��n�r�E�����=3�m�F�dоT�h� 2�0/��@<��v�F�8����u{5b�<� X��.��5�@$���l`~\���d��hট��pv5�SomD�z6��c6�,��������Sh���u&?� ���
\�#�^F��)���u�ϥ��c��DK�|{6���?&wǟX��W�4����$�W%q *������n�H�����_o���_����85��s>P��Y�R�������ݭ}w����4�+m�:����؉]~NӁ��T��'v����z'.�- ?"��	�͔�Ç���蔀��~G;���:q1~�mr�����?I>`���n?����n��1yX���SG�	�~z7��jӱ� z"$3�ûw+׫!R��_��)�@�U�+�?:��� �	�NS�ɘ����?;��ޏ��^�'BB��G3����ap���0�A]���T)`{�]γ�@���A<��+�"������4�/?rʘ����?H �i�9@w~�~���6�zg\��{�>�@Pޏj���}HF?��MO�_Q�ŭ���ӛ�AG��+��
�?���|D͂A��-9�x��מ!����W��f��1=��6� ����_�&1;��fCo�=$�/d��|'h�,����~��15���R��� ���q��|4��������S!Ay�ם���t���7�EȄ&}x�nz�xJN8b��x߱���c�}oi�r_���>}���%�}���F�@�G"�!8&j�]������Z���|ߩȑ4�A�1�H�~� ���_@ ���z��hU��r�I�wH�_-Rؿ��M��7�Q6���@�8�w>g/�I�v^ј4�g����'��9�������ya��[����������9�Vrx���c:`����k��x��A4�PB>P�U���� k��S�_,[D1��yc^;.\/������O�z"���Ĳ@~�����!���!41
���T���ů��,�0<xڡ�t |u砍84�Ї>p�hi�+9�����Km�C����p�����?p��nu���$�����]cz������t�~y��O8�C8��c8Ǹ��ᣆ��t���L<��_9�`0������t����fz}\��U���a�A�1.@������Лq���T8�E��qև�c�����J�q����HL_�����=,�X���@����r:J�`��ְ�c����IG�*��m�G%?�O1��^�~�0$F����;���۔�~�A�ů��ټs�aI{x�1C�I΍�l�����'�?�[�Qx'����f G���c� GIp�hD;�� ���������\��c��q��I���?�]r�5�5Ò���8=����3��Q}�⩑:�e�������VG7���0:WD���_��?�F����8�9���!���q�%��������(yCe��lPbG�،���k��f��d~���_=9Xcr>J
u1�c$#Ώ���r4z�^a��q9�[�1�h/;�y̉�>4��Ek�<s�2�ۘ�f��Q�)&��.�cc�uĞ�F�'X��i�Q�+��^�rt��1�y����i�Q��&y��}~�~����q͎��.�Q�>�(����3��~s4�Q�l�1"����?��;���6��~4#j82��EscI��!Ɲ��va�mo
F�>�O�p�l���(���߆�|@=�Ў��7���7&�I�_ ;Xf�ɿf����o���DG��7�;���;cR��@M{`�|�G� �ޗ�M�_7m��0�	@\��{w�E]mJ���<@|Y1����?ݗ�ֳa���=3�kԴ�����e�h�����:��u��V�3�Vȼ�	t!n	L{ޖ�}Y��Eazdf��Ȼ�v�UQ��C���82�N�1ȱwٖ���V�?p�$��I�
�8��ص��'맺l=�X{����T����R�/7�=�Z�)h�vQ�u韭�6���9N�@��{ׇ���M[��	���JW�K�Y��⭬��I�@��h��u[���n����e'Ћx)������k,�lU��m�}4�	�+���%e�.+|�E���w|��{j�}�U[�K�^Ԟ�?�c�aW墭��~SnE�'��s�}�6�r�;�w��*��$�O�6(����fW�ɟ��g�%LXp̀� �}h��&;��6hF�T��`�:�N�bX�b�Rm�	����m�M����99���BW͊���9h9���
���E����9��B$�2�\��*8:�u[����GY�e��C^����	o�꒢=�l����nA�h�V�f\�i�g�I�� ��G�<����iQ�lr[)H���Ŝ�RW�O�����7k�e�-w��b����'���H=����ESc÷�h�=ɴ�@�Wۢ*V��M�\��E�	�]|	�e[��|�ܷ�����P,8ޗ!j|I]��Ů��J@[��
���o�o��x.������P����K��+� 80�������,��=q��L� ��R �F�yӬ_KmKj���XB�ÆB��櫦��K �̜X'9`5mM)����Ik�����o!ЗU���/��T�z����7r�y�_���³ihNr� ��{��xl��� 
��F�
h�]�o�gh8/��N�:����O[|��}*����6Ǎ��`g����+;"�@�N�    7hK,�����	�#�K���UQ� �`U����T()���U!�!X���P����d��B�;��jGU���R�����S����X����;�f$���P�*��iu0tA�r�q�٪���E�t���u8���Vmy���?�Ն�3J;]�w�R���ݏ��z݋bqk���-�
"^x��gN'�P��d����0�'i�
�7nK��b��ؿ�������m���5��f@;@Vi�k6�~�O��`�6�\/� [�R���=���%���[d�'0L�^p�%���|US�Y����=P)T2.�n}�`��(�և\ ҇f�@�m�s{؉Pb+{^��07�/���=�|E'�N���s|%��t߾x6�Lbl�)$�U��P
���B�/�(�һ�C@^��A
�C����r�wI� ,b����bQ��ֿ�.* �q������xW�%����_`�r��'0���aF-��t�\Ph#X��d��Z��x���l7�d����ޔ0v%���^ג�Z,�}�k��g�\���*0
�l�зQbo���}=���`�2��{q��-��UH�_W��KYST��l%ws�����7�����vjh���O1Tn�kK����M������i(`π���F;���;m�v
g�\�2���L~*�O�ͼi�����4�n˂�t�}�1��!5��r��`�&����ˠq�W�&ޝC>��
8�B˅T�)1$��N���
�&Œ��}2 ?����O*�(ȥ<-(X�\A��i��w9�hf���+PpX62@`��i�I����Z}��p�CT�JYU�=��"%�l�	��$��؛�b�@=��-����)%,eY	T!���Yz����)��sC Iiw@p���3)�f/�R�0��/^d�rR��oUSӐ��0� �9l&m�^7�3���W;|�0
�� ����*,x�дz³�G0M�Id������IUoA>xxC���[�zz:Pg�ޱ�0o�IB��xc�	���k� ^;�$�Q(]�'˖O3��@O����m�Uk�p���!-�5}b���I[��j��AHYL�l~�"��U���B�4QS/���f[R�Ҹ�'�c'���Ŧ��*XAL��}�������,��G�|蝻48�FM؏@��V�]�6/%�RY̘�
�}C>�a+�s�:v'�:J	������2q�J/�����AlD4�xd�LZI>+�/u�N?$nIB]�`���4`]v�E�Ƕ�c�ߔu���b����j�� Na��F���N��|v�gC�H���5Kɠt�fB�8~<@I�6t	�V&�J`{��>5O��j]70��ZY5|��y1'W���
,�}����YI�={ݷL�*�N� o��B,�@�.��BzϪw�9t�`���$!jO{�]��C����&/�]Ka��v��O���S]�W|0�5�j�v�Fv����<���Jh�0^�Tb�!;߉$a+��f��#4	]�/!��Yѥ{�k��=��ߋ��7�RB��B��V��K���W�m쵘�A��}uX0�Y�-���+�߫�@+��B[zo)4)���n�;PN�.���!��~me�`�dS���~]�F\�Ԍ�o*�]�@�OO�&�{��k�u�	��bi�xc�"^� ��ԥ�/��Nޜ�1ۯ_�%)e8u���؂��op8��X
�{+�c�ME<\�:��wg�O��5n	�,�ⱌ���n$.��b�a��ա�|����]��Tސ/�@�k@�]�]E64�t�"Z��6v�j�>�S�4/.^b=�x3���"��苙HD�R{ :xk�X�0��-͹L�|״tyvXi8�!6 Q�!e=wY�Ʉ�p;i�p�B,2v⦁��g50��a�妥����ƇZ�2ʭ%p��*L�՜�|^�]���k�����͞�[X�T�;�.�6ؽ��$�w*�z�[�����ԃ7\���b�+��UKS/��;۱�8��Xa}ӌ7�� hO�������R��h��7�Y�%@0?�x �|xoðI��f��_mv%Uh�"sTH]�5����D.�MZs`�j{�����PK��Թ�r+��P�twy1��f�޶ ����$ے�{�>���'K�\ �?g�,��K�S �Ƕ����rI�.�a,"1�%h_h���^���2� �X���A-X7"��%�n��n;<�U;m�4g��o
�����z�!}�o�X�q�@�_[� ��v\�%
���z�����n9:�F����ϖ[�"}"��CQ?�
j�3 ��1��/������7���d~8h�~�0.>1#-�,5Nts'�F$�YK)C�/+���-�?1���#~]�$�Tb��3��8�4���+��%����65O�{��E�u)�D[��M�
m�%p��̝wZU��_.����e	�;�P���<�L��1�e=�uU����{:��c" ��n�)�{�[��*'�j�[�=^'n���?�5x(a��r�e ꦘ_V��R#�S$c;���n6���� #�-�ƿ?��@)�5��!�Xmpc���w �B��k<�5��y������Zq���������p{\Z<����7/y��[������%v+�m�˔�B��i�V/�
�d&v��1��J<J�tI'�q��o˰6t������`+/>Ğ�O��M*�����nk ����� �Dx\������3�`Xכ�
<CUo)�avA ��իe�r(�01�l���X49�!v ��-�@�e�:UH>�b8����� �-�Jx��C��L;��\�$�!�&�~�~��g�nU�Ay�^_��`��p
R��B���E���S�������
��,a@�ڤ��$�W�>̏�[k��DÂl�W@4(�\�+���q~d�8I(
FQTT�z����A�3���¼p�ʺ,�Ռ�)�Rm��.�\�:k|p�m$�/�`.�*I�J��\,[,8tk�p/�@��=��,���D�x�$��5�Q��R;��-�2x��/��C�B�j"���� jK�����l����z�dK�:�=~T���$��J^�Xn��v�2���7b"�8-DMVeP�PC�cJX��$�c�.{�v83��e2�Xy<���YY0��PA6w�B¶;E4.a�a�=}���<�؊QE��?*�T�����I��3V�&6 V�f�ܷJ�]@1�h
�N%��Hu����x��
(�|.���};���,  (����6�p�$)�ld�$w�=Â>:�`M
 W�'p˫ߕ��"��c.ɰV�m�r���d����b��@u��x�𺋌Q���L��|Y>2���r	qJ��[L~������c�@����(:���QC�����R�}�}y�n���?�2&�v���O��i��S1Y&m�,���W�;�&��"䊄 <��Y(n����3����l��'b&��cV�C���e�,�Rf�����tѽPD��0M��?�>Ꮺ�o���cM,?l�ɂ��+��"!,�7�Hq;m�e�Xz-�)(J0g-ö9<�1v��ֵ���0��*$��u	lv�0!V�iypc�S�^@T��R��0��{OO*fb>��Q&���x%9I��0n�_�Vȅ{�ܴ�1=~��fN5��SJ����ʿ���IJ �o �ş�5H�3�)W���j�X=qf�j�4��A�W����)���N̪�Ԉl��u�Fŋ8�qE2�C�ق�bTR*�n�nZz�dл�9	V��/���C�����U�,���[nG�������PzRG?�[���}�x|_UTys���p"���\�;ߣ� �<p����`�.���O'�o��/v+:���[�8N��s/�wB_��F�{𕔏\Õ�ΗgKJ� ���YpW��.�Y�pc��r@�{ $��\�N9� �    �j��g%3X�� ���
�5���	{�mzh޻�]��R����F\��<�:X2��D#y�a!8�s&.r��)��) ��?&�NC�[��CM�,�ExN���* #�}��ׯ+�~ �R�uȆ�|��5%8@W���i���z.���`v+�-=^����`6�P�c�I�� �v �������G�n9�L�M����g.kI�����!ڥ��l D���pF�Op�S���9�5q&�	��/O��I��s�D��ʻ���
橻4�<,0AM#ad5b<(��[j8hh2���iW��Ȑ	���ɖ�W%������Jxp�U T�i������)��(�h2pi.@�D��>lYݲ`N>"��D��Q�D�bؔ��%ddl=��w����T�n������������y��g� d� ���$a��q{$�ּ+bLn�m����1�W��i6�0/bH�̉���Rp���f�����-�E��`>�
�0&u)�0��b���^4K�/
D�;�,j&:2.-��R,p�ݽ�"��9����鏆h�=��V9U�
S��+�؟�=\)zQ���ja��-Y+ ƈ�����/T���[�sf2�Z��g�XԘ����& ������*���2�|����0�̫7�X��J+�%&�����F�=6����X�<��%��!ĦEy��0��W05D��S�U|�WWo�������X������Ņ[ø�|�&Z�cm� ��}/d��KYк�/���m��j��T0OtC2'v�法�|�Ϋ�G��Q��������ϥ�B���S�[fG�|PɀwF	%-�q���V5X�8	��T����%Lc En�����`�D J��mv�q��\7�m�j���
`��K�Ш2Czy�ai��8Î0��;b�Z�,�`��X�bsԝ���B��2S*?��e\Հ쁅�L�>�	��]=�qxa5qI��zi:�m�����a�έG&�q�~���l·ρ��N[�Ý����,!S�1�	��RHI�*��j�G�`�*�w֙(b�G�OU,Q� �E.�AZ�}V�b�D��9�2��g��eK7�W�˫�]��k�����Osb�����HU?9>��E�-g�ZaL��[EM�02w�],P󔛥��ކ�$<4g��%ź�U3��=�si�unc�.��ʁ��7X{��A.SzN��SY'BH���*2b�d���jY���4{f�M��PqI���x[���BiV-ce��)SdR�0f�4r��v��<w��1V���c�pW�*��Ůa�\ ���i�eR��w����kA[|n��Zo�͈��G-�
������ь��"7�K�n�lY����NyA�?7�B܂�b��ʺ����ǗR�����D�}Aպ��\	Z�+�$k�/��� ���4���S�TL���7m�h������r`��Xfb���N�y�x�ɒ��<u�t��_����@��M�ޫ�k� V��M�� %0����ڕ̡��Gb��٪|}errQ���&�9>�h��sB	�R�;���b΂SN�#�`ڮ����Pɴ��oɸ}W>��x����PW��*�M�@�*UΪ���T��{�`�Q���O��������I[a��ڬS��xN(�-���+��<�)����1�3{Hr�p�9a�i�`x؟��L���FY&j�����'潗��� s�`M	��a��%�rSh�m9���b�� i0f���g�)���+l햶*���m��2;��.*�eJh���=l��@DK
FH�G���P���=e��dx+NhKr������+\��ײX~0�#d:`� _3,�]P8Ѱ�d%d�P2Jgi�40�N�j�;\�(��1w�PC,NuM����a����J��[�O�Ke�Y����	�؀O%P0��p�����U��3P�*��UERW5ܗ�N�v�A���0Xz"0���(I��H支{E۶%x��սc�f����� <*P1@�Pn�2f�^mȸ�*87�᳢n��`��g�����j[-�X���ł��Z�������F��O�WÄ0��(ӝsb���B^0��1	�f�x"��{���)�l��O�7�*�e]��!ʌ@i�P�+~��1��\G~��"�-6ު
��#W�mb:,ox���-�6G,k}M�(ψM+V��w	˨� ��X a"��`1u/�m'`j��]�ڰ����:(|����:�eX<�|����8��J$c�X�M7F8ض�����3X��j�j)4�Z\����P9����sW�u�`"8.�� �8A�i�z�(�Z`����0DMm��y��K�u�ŉB2��!�w� XB>�M�j�-3K�� ?JzpA8l��%��*�a5��!k��O�/�4�p8":�XNt!(V_��ဵz�����a��l�VR�T��P"����O��2�r���P0O%��xm~��O(��)N�
��`*�8�@��Fa�¢ݯ=@k�;�:@70[* d�?I��TA~Vu2��o%!��%�@�w��g����seE鰃c�@@`�(�U���]�Lh�3:��:�#=A���b)��LWOrP�x],�*
s�k���� \�
׋Y�"R�Q%15�:(����$��]�(���T8mTK�h ɥ����\yQé�ÿQ�Ίw�Nd2e�,���_�v�z�b�'�)"M����=�t9���ʌ�K�S'mmdS#�*y.I�T�W�����,`X����		����is'���,�0��
�������+%]yn���y���|g1wUmx��k�R|�V,��3���05� ��b��0�4u�/�!���j��'F����U��̢u-�iQ9@h���@��aQ�?wƟM�+�r�\��]2�BqzH��:+�w�� C	MX(|�#/X�~(0X��2C ^���܆S+k�Z�~��	V�-TS�R�yQ�R�?�\&w/���p�I8��|�e�c���$�x/��ž~aq[��Jda#�����T_���p q�O����8�&dn� Z���@3A�p�Y���A����X��ĂP��h�n�e���]-3�J����U��Ů�ը�dS��ZP���X_�B`-���[�O�GC�Gl��Pf�5%�r_�]�G��=�֌x��0�R�a(�f��cU�J��;���Wn,D T����Ӷd�X��Zb�f��s�z�O�������y�Sw���5��"��tW�*~�j�QI�	RW�J�y�v{x�ܛ�Ⱥd6�=�_������A���Bl�xJKg�kb��,΄Y�b��G ed<`��MSo�#��n�do*�A�F�YwSh��J�_ȼTơ�������������XVm�f��O�0�-��X����kS��\ڑu#��m�*@5���d!�A��x�z]8&�R����K]񵡃�+�\��K�.� �)w�v~I[q9H�U4����q�{p�
��,����v�g��s�.�1���>e���5�;iF��ֲ΄IB��o��rX���jm�ʟ�s�v�B��R�@���钺��Hn,(�1�}����-�^y�{��*�)e�,4��+�w���lx!['[U�2�Sp�A\�2�&�-)���rs(`�Nx���'�� @��f��H-07�~K��0�tp��=#���_b)������E�,'rK�v��1�,Mr.<�D�[x	�:0�-���@n�?���X��k���a����J��i
�H�������hN7���RI�3
�"J�m��!І-L.����5tF_\k9�[}���� �%� 1 ����n��:vJ�c�M)�'�U�XVo�i9�^�>3lg�.�k��p1�� ��>�7������h���i�l��L��0"��겆�S> =*��tҲ^$�]e���p��iA͆�Q��5��c����Y�E����-SjX�ĸ.H���-��+Tަ������y�� ��-�D�    p��o��}����X�S*4�_pgv��$�2�xe�W����,�iY���Ǖ��p�&�efQk��Zi�R�~:i�ZF�_���`�@M�1��.�/~0
�2n�K��EH���Z�.^�\�3�+G� ݧEdR�~._W� ��2)��Mɘ��l�X�=ѴZ �oĔ�j��NY]��Np�G[��-��~Ԧfg�Ȟճ�f��-�Ԩ���c)U��8��펅��!�*Y�=���db�R*�^,�n�U�fm�E5��(���YgvO���kV�2������PMI�(�WO���BǊ��T�2K OX��1���=�Ι�y�W4��{"Z�TU����ծ��k�*�I�����҈E�ot���b�vT�`s�Uh.\�"P@�C-L֧�ީ,��0!@}�*������l�tY__ݗ2�/h����
Fx]�9�eeR�����*I����F�TU���O��.�r�8X�8)Wg���/��BŒ&4.B_�&OUz��
�=5�~0lh߰��+�SC��jA����#ݿTx6á��?��s|�/4 w����v�UJ:$,S�����q�x�%q�qw��lS�����������Z(�&*�{�1@8�q���n�� tځ�@�P��eCZ��<�]� ؝�/���c�b:>��*�O���Pk�|�;0\)�l��j<�
0�+$et��������V��+�� N���|��4�;j�r�!sAΖU�g�f�auQ����v�tbIk,�s��,����oU[IpP�7��	�~٨��H�;
�xKʽ�;��&����w�l
c��1��2s�2�S2 7t�\�`JS	R��&�ov���Ǟ9��f�S�K�� �] �Ļ��`����qK�E�$�����U]�A��bSa�N�w��|f;T�ǲ-��: D�۵�W8�a�¹$�x��[S��M��Î��ܸ�Vct%!�� x� Ur�O'>oU�t
tQ2���'� ��1�_�U����c� Gޝ��Z@*(�ąxI����,f�mh���u	���'<�x�K�jv�GT�z|��g�<��5R���X�
�ζ鍪�'�.ѱ��#g�U5�v}�1$�v7��S��l^����Z�(��'�gQ4 y��p�!I�&X���[�H���3�FƏ~�����r��ޭX���;���M��RX���o 
���H�/�OqC� /�P���zw�UYF�!
�&.�:}��B�ϭz���U���csw���9P��T4�E� �P�D�O�&;=��֜ԑ�����,�ƚ�|U�𳺮@eI*�_�46@�q�! E�ި�y`�TM��f̖�5�9���tl�NW�	j������蘍`a�Rj��Λ+*�S,�H�N� su��g�j;<eއ�;`ϳc7V��l��,j�%�0tŗ �!pL�X�|d�ﲬt+i:��kQHBhÀ�*-�\���e�����_0ڞd����t�<��n��	iB7�?�YC�F�L��b�:A�nK���G�v�M�ژ���„������j\3N^��L���\�llsR��$�bXAFi��[�'q�q�6iּ�����w3��� �� K�n��	k���Tp�e����!L���~�Le��	?k��$2]q&h,0�I?o�u� �N�s����þ����-rC`@N�-+պ�➵�Y"~a��*�0��� I9"�=R��n�bՄ�Y��Þ��f�
�W@�q4�M[4�Ls2V��XP����̿���nVo�1`�T7pL�Kv�$��9����״Z0�Y�o�8X�U��9��,v")�@��XǪ:��bS'�Y2T�\�աi��5I�Ԯ�I�̰��u��(���Ŕs���1X��M��k=�Xd/�Ў-�yu+h*G,p���G������Y&�Eg4*Y[V+��nT,�	�0 ^Є����Ó�hrg���v-Ok��a32q��$�LNlZJT��kc�194�mTV�S��q
���5������9u%b+��Cy���`�V83��<=:S�ю�K�K�X��km�zY>?�ݘ��Jݺ��8����6���r}�Qׁ2��,�&w�ВzD4
���A��ט����	O՟_�龪�-bzu�j���y��ے]��Uy�{5 �`���Y�_K�Ջ
Z����Z�_�1�ua�ͨ!�k7�Ӂ=vң"gl7��ܰ*��^du�`��*�C�,�0�t��Bl���Y�B���ŝ!b����ZX���$F���V��\R�FcՍzE���gΤ`�M��Y���Z#y��^j�qi����V=�yf�R�����x������m�����Y}��Î����i�FH�����?���o��x�O�n0���r[m�؜�й��3�<MźqEFI�9`����O��
�Ǫ�ᑍ�a�ޗr5h�5�''1�";����a�Q��w�k��_Gbo�J����]H`�=0qF���,�I�@XE@L]-,=-Y����2�t�ҩ� �g�($��p��P!��dx�p�cJR�yL��!Ϲ|d�����ަ�[7`��g���gy��eU̵lϳ)Vu	J�^��[a�H'�ydi��uG���{h��y-�PP���0�/��	���ƕ@��M��%.��N6��9[U4��x���O����k0ӿe+�J����,^5��s	���M��NϽ�j]�8�h�5a�̰N%���
��`�k0���J�u�N��q��P��M܂E�Sn�@�݈��G\�����b$�c�J�Bp��w*�T�2�J.ɣ-o����$�2P�3F\�#?1SZ.8�.�<�mIds�o�W�B�x����8Kc��:IX��5 �ϊw*�?����+y���[p��l�Ԓ�]^�b��{I7Z�m�?�b7�X��2�0W���QWhrF�ѺF�����R������?�
L���"�lѝ�q�n���+8y��%���;��:6�i���`R�ϔx��{��*�Y�'o�nSѩ�����\~*5h�0�6�q�է�0���ŗR�p6D�'q�~��,;���Q�$&�Ԩ�K6^� ��x'��.�N�%c�p�\�����$VΪTv�z�LS�)f�.��ǳ/�,�xq�5;����"uYq��M뚻RtRc�6.��pӭ	:�ã/;`�b�|e�U��}�t|�})X�_+��1?�){��b]��)bX&�ȧ)�s�&OO��a�|��g��]3M���h5zQ�P/#�u���_�ax���[�c7< ��j2�X1K�q�U�:�.�ݏׂӏ��L;��*���\��f���2m�.��s0�<8�Z �ƪ&��\2�3Yw��A욏C��y����r�8C�|錓e�J��=T�;�0κe��_R)~a֎<p��1y�+&�f}i�6ͮ�j��e�]�$�7��>+M�Tpȣ0���#�ܰH��K���;��y*]���Wc���佌mü��UU�Ъi��<`�C�^�r��D��}e�C�y^>U̼A���4����q�a��X���ʔ)�ȼ���C�١^7A�}��l�*��\t^��5�|�aIӑ/�	��IxfW��P��+Ut%�u����hN��>�W�h��1'v�@?}b���S�b�,d�)�ș�(�R��΋rN��/�Yh�U�A	g�u�p��}�j�ً�b)����y@捫���2|~#��"�L�ڪ��N�fe���`��H~�̵���R����o7�bv������Ʊ�6̻0��d��V��Şu#Y�*�B��9ە����\�Wʙ(��yH�x�y_4�,P�Q�a箊P~�[���2��j����Bsq�C`;Dfh'�8�L8��d;�����:{Q���F�L�ػ�E����#��Hw�@��|6��"�9�ŋY�;+.�.X���Y���v� ̃Н��uY���KD��7��-�L�(\dZY9�{g�Fx�;���#�\�c���7�s���%����:D�P(!p��-\mg��u�bX����X��yX�cU>� �  w��4u4�3��yJ8g��8���Kf�2�L�#3?����Ww�8�[ӽ~.4�W��&u�A�%��������8��I4��*���Y,�+5O���%=SX�5]���uA�$p���Ӛy]���H�+Y�6_/\Ӹ�**�yt&�y��V1�T�51O]g�c��	{��)k|.�G�rlO��@[U�d��r��*����y?�C���SƂ�fN�J5]���9|9������	s��f�W�tR��3�_k
�����-��^3�>�9�%�����f��ۧ�Y����%�<5󶀦��[��e��#�i��n��5˻�7��1�`���]�[���s���ݻ",5�X���ᆜ���ak+7Q�s!O˜��������8���C���
����Q�F�J��u���Ԭ:h�5<߷ݮ��<-�Q㨘O�ġ����U߄<1s҅�~g��/��}����������n��5��@cU�f�fe�4a�#˱��m!π�5`<��*^�l�u�|P���*���憈#����1n[/]��'s���gc�lE*�妢-�bM��1�h�_Xse(c��a���!O�|���Rq�4eL�q!t�l�ɨByr��՜�<���v�Qe�p�d'VZ���0P���&rf4�8�͒O�j͂��y5�)~�ȢbU�猼
4�PL�@� w*m��bd�G����	20���7䙘,�kZW��f k�n�P�c1��4�N�q�*Jw�̛n ��A�b������!�Ĝj�˒�Bʁ17('�Gb>��G���yS�D�v#�C����ʊڶ9��0`���(T��B��>x\M����w֠S� Ul�?H��y_�=���w�h!ü���mM�^��QX��`��
C�qD��HY�;!��D�ևv�⨢����a$/4|��wIr7�-�)��ExT�U�䆑 <�*��hd:���(f#�P����gו���FK����C*&~�F�s����X��d����#�j���x�9�ɶ� �Y�pEg���Sh` ��(LWXs�G�^�L�n�tȃ09�|�U�����VĐav�Nx˪���y�����&��A�"f������dd�b���ܳ�8��<ِa�����5�v�-,����iݧK��V�(��_{���tkó0�v�����=���=;�BC;Y�
qрl�������D��N^�Q���Ї�g����d0`�z͹l7�����"���L�WkVh3�Fok�-���}p�9pfj�q�4'q96�M?��E���G��'���Üֳ�.! ��Y��(�Rb�a�C��p����9�B�iFr���~���\��LīU3�R9|)NET^�T��N�͓�͐
y"�;]Hi���~&�8�m��>)i �k;Sb4���*���Q�kj\A��0'k�r<��.6ox3k]/sȃ0q﭂$0' ��#%ωӟ�%�~P�T������l+ ��kvs/B�I��.+�V9�9aR�9����i��`���d�vֶ�Y]pYObI������P��k�@�Z:өA.*vf����Ι1���G`����G��a�>q���k^�ܵU��4Y�I�=^�i�rNЮJ�s�,ǹq4��f��Of�IZ�g`b���pS���&6�����`~�+D�0(���'sF�&ݏ"1-��{�uvө9f"`�
�Yki9Մ5��flճ=��4�ȵ�Z�95H��y���TCG"�2W���xU9��>����<P�l{Ƣ�H9|�\�G3՘� f×	���#�4����X��`�s ���%�+�s���h�B)�Mվw#�ԧ"b$�n��O��`֢.Să0)�;�B�C�q��A!OÜ�5�������u��y�}���fLn�'e]Y
�T47�z=��7NL�����d0�R�o�Y4Q��x�y��8�Y]��O%�<	S�	l�_���*�y�<����f���
�� �l��$�X/0�F�����cT����5�cr���Ԙ�_���V
mɂ%���mf<v@�����9�*�A��~C��ٟ_Ş�L82,��:e�wyp#"��� ��G/6;l�w؞}�af�W��w4�=i�Y��g 䱘�d�%Q����v��қ��=@/ʢ�<4x(��;���՞��L��ƪ�o+�R/����
D�q|�X5�L@����c£ u����L���f�i�l�G��iV���D��v��X���Y��Lw�4g!x*�MO���lJ�ʛ�@�gbN���T�}�5��<�&M�g��8�1�v���a^��K�;�
W��5�PՁa>7[NH^1��w�
Ô�e��[%d�N��g���&��bͦ��f^��w#�K��\/�rź2�T͜ 'L��톍���s��	+(�H��9�02�W/�Y�}�8�Vٕ�r���(L`E���mw�TP�1�k��ywtOA^�������z�J�8Җ��L�|8���a����J8ʺ��|d�����w�c��(�9!uI��[�\��\����A���� �;�#�A��^��I��w�M��P�`vS�G����{<S�A�Z֔'�����_pf�z��ڥ2�r�U�L��!T3�y�z�Ʃ׺�c�0J]CM�0]]�Fg��W�-�{_`���ղa�?С��	�׮'��R��e�)w����O( �҄)F�p��S=�Xl�lS��������&�
�oźr�9�(��"�R小���������"��R��ndI�ƒ�<��U�:����a�C^�����Y8TkS���үN�;��*X�Nի@�.vx�_B��dY��/�υ(�m�م���g�e�F·:�R]Uu�S�[��Κ9,�W�v$,��Mwi����M�R3�F$�����x�嬠��l���8u�KC�yY<��a��J��d�1#'�h�w��C�9`����7f(ե��b٨�k��K�Q�P�f��0����^��V��q�.�I��&,`7�'P��6N�u������M���ww#WC�w��wsl�M�ĺ��g]�6�]���HߌS+�;ˏ���0tY"�Y��X�̂�]Þ_�9�(��#�%��Ì;�c�~8W�m�W�HԐ��'Z~?�� �w�*�Ǜ�!w�X�!Ќ�y�<ʒ��b���_�ϰ����,U,��q�03����X�;�ڽΊ��9%c�4��p�xv����s��*_ax9ոi0!���W��������9=���y����I��h���@Aʹy��u��>�OF�����+O�%7}�9O�h�I[���a嶧FA�M�
yh�E�����qw�!<�b"��c+]��jtU�\�,N�TQ��;i��[`$$��	�MCw
�\ݭ\K&�8���ЯNf��v6e����q����㇗��O�&*��%��5��a����`2 �X����n➅V�e��
nĊ|��q9"7���}�^2�ȁ1��g�¾�ň��v�)y ԡ`�J��U����ϕ5��~@�.5+Ε���͸T��^�8'7rX��8�������}�      
   I   x�-���0�0L�!I�]��uL�ϝ�f�����D��K��bf$��<�!CVm}"���@���;���
         Q   x�%��� ���L@
�
1�H�i���s��^BݭZױ���
�+#	sd���]Cq;ڹ+xf�s����m��"��HD/E]�         F   x�3��I�K��KW(HLO�MJ-�	$rsz��B�=KJ�s�L8���RRRS��1z\\\ ���         (   x�340�4�46�24��1�aNc0�Ѐ�Ĉ���� ��     