PGDMP  ;                    {            OficinaServico    16.1    16.1 1    :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    16625    OficinaServico    DATABASE     r   CREATE DATABASE "OficinaServico" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
     DROP DATABASE "OficinaServico";
                postgres    false            �            1259    16735    cliente    TABLE     s   CREATE TABLE public.cliente (
    cliente_id integer NOT NULL,
    cliente_nome character varying(500) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16734    cliente_cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_cliente_id_seq;
       public          postgres    false    218            >           0    0    cliente_cliente_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_cliente_id_seq OWNED BY public.cliente.cliente_id;
          public          postgres    false    217            �            1259    16749    peca    TABLE     �   CREATE TABLE public.peca (
    peca_id integer NOT NULL,
    peca_nome character varying(500) NOT NULL,
    peca_valor numeric(10,2) NOT NULL
);
    DROP TABLE public.peca;
       public         heap    postgres    false            �            1259    16748    peca_peca_id_seq    SEQUENCE     �   CREATE SEQUENCE public.peca_peca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.peca_peca_id_seq;
       public          postgres    false    222            ?           0    0    peca_peca_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.peca_peca_id_seq OWNED BY public.peca.peca_id;
          public          postgres    false    221            �            1259    16758    servico    TABLE     /  CREATE TABLE public.servico (
    servico_id integer NOT NULL,
    usuario_id integer NOT NULL,
    cliente_id integer NOT NULL,
    veiculo_id integer NOT NULL,
    servico_valor numeric(10,2) NOT NULL,
    servico_descricao character varying(1000) NOT NULL,
    data_inicio date,
    data_fim date
);
    DROP TABLE public.servico;
       public         heap    postgres    false            �            1259    16781    servico_peca    TABLE     �   CREATE TABLE public.servico_peca (
    servico_id integer NOT NULL,
    peca_id integer NOT NULL,
    quantidade smallint NOT NULL
);
     DROP TABLE public.servico_peca;
       public         heap    postgres    false            �            1259    16757    servico_servico_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servico_servico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.servico_servico_id_seq;
       public          postgres    false    224            @           0    0    servico_servico_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.servico_servico_id_seq OWNED BY public.servico.servico_id;
          public          postgres    false    223            �            1259    16728    usuario    TABLE     s   CREATE TABLE public.usuario (
    usuario_id integer NOT NULL,
    usuario_nome character varying(500) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    16727    usuario_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_usuario_id_seq;
       public          postgres    false    216            A           0    0    usuario_usuario_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_usuario_id_seq OWNED BY public.usuario.usuario_id;
          public          postgres    false    215            �            1259    16742    veiculo    TABLE     �   CREATE TABLE public.veiculo (
    veiculo_id integer NOT NULL,
    placa character varying(12) NOT NULL,
    cliente_id integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.veiculo;
       public         heap    postgres    false            �            1259    16741    veiculo_veiculo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.veiculo_veiculo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.veiculo_veiculo_id_seq;
       public          postgres    false    220            B           0    0    veiculo_veiculo_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.veiculo_veiculo_id_seq OWNED BY public.veiculo.veiculo_id;
          public          postgres    false    219            �           2604    16738    cliente cliente_id    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN cliente_id SET DEFAULT nextval('public.cliente_cliente_id_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN cliente_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16752    peca peca_id    DEFAULT     l   ALTER TABLE ONLY public.peca ALTER COLUMN peca_id SET DEFAULT nextval('public.peca_peca_id_seq'::regclass);
 ;   ALTER TABLE public.peca ALTER COLUMN peca_id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    16761    servico servico_id    DEFAULT     x   ALTER TABLE ONLY public.servico ALTER COLUMN servico_id SET DEFAULT nextval('public.servico_servico_id_seq'::regclass);
 A   ALTER TABLE public.servico ALTER COLUMN servico_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16731    usuario usuario_id    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuario_usuario_id_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN usuario_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16745    veiculo veiculo_id    DEFAULT     x   ALTER TABLE ONLY public.veiculo ALTER COLUMN veiculo_id SET DEFAULT nextval('public.veiculo_veiculo_id_seq'::regclass);
 A   ALTER TABLE public.veiculo ALTER COLUMN veiculo_id DROP DEFAULT;
       public          postgres    false    219    220    220            0          0    16735    cliente 
   TABLE DATA           ;   COPY public.cliente (cliente_id, cliente_nome) FROM stdin;
    public          postgres    false    218   L7       4          0    16749    peca 
   TABLE DATA           >   COPY public.peca (peca_id, peca_nome, peca_valor) FROM stdin;
    public          postgres    false    222   w7       6          0    16758    servico 
   TABLE DATA           �   COPY public.servico (servico_id, usuario_id, cliente_id, veiculo_id, servico_valor, servico_descricao, data_inicio, data_fim) FROM stdin;
    public          postgres    false    224   �7       7          0    16781    servico_peca 
   TABLE DATA           G   COPY public.servico_peca (servico_id, peca_id, quantidade) FROM stdin;
    public          postgres    false    225   	8       .          0    16728    usuario 
   TABLE DATA           ;   COPY public.usuario (usuario_id, usuario_nome) FROM stdin;
    public          postgres    false    216   &8       2          0    16742    veiculo 
   TABLE DATA           @   COPY public.veiculo (veiculo_id, placa, cliente_id) FROM stdin;
    public          postgres    false    220   U8       C           0    0    cliente_cliente_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_cliente_id_seq', 1, true);
          public          postgres    false    217            D           0    0    peca_peca_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.peca_peca_id_seq', 2, true);
          public          postgres    false    221            E           0    0    servico_servico_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.servico_servico_id_seq', 1, true);
          public          postgres    false    223            F           0    0    usuario_usuario_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_usuario_id_seq', 1, true);
          public          postgres    false    215            G           0    0    veiculo_veiculo_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.veiculo_veiculo_id_seq', 1, true);
          public          postgres    false    219            �           2606    16740    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cliente_id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    218            �           2606    16756    peca peca_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.peca
    ADD CONSTRAINT peca_pkey PRIMARY KEY (peca_id);
 8   ALTER TABLE ONLY public.peca DROP CONSTRAINT peca_pkey;
       public            postgres    false    222            �           2606    16785    servico_peca servico_peca_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.servico_peca
    ADD CONSTRAINT servico_peca_pkey PRIMARY KEY (servico_id, peca_id);
 H   ALTER TABLE ONLY public.servico_peca DROP CONSTRAINT servico_peca_pkey;
       public            postgres    false    225    225            �           2606    16765    servico servico_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (servico_id);
 >   ALTER TABLE ONLY public.servico DROP CONSTRAINT servico_pkey;
       public            postgres    false    224            �           2606    16733    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    216            �           2606    16747    veiculo veiculo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (veiculo_id);
 >   ALTER TABLE ONLY public.veiculo DROP CONSTRAINT veiculo_pkey;
       public            postgres    false    220            �           1259    16802    fki_fk_veiculo_cliente    INDEX     P   CREATE INDEX fki_fk_veiculo_cliente ON public.veiculo USING btree (cliente_id);
 *   DROP INDEX public.fki_fk_veiculo_cliente;
       public            postgres    false    220            �           2606    16771    servico fk_cliente    FK CONSTRAINT     ~   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES public.cliente(cliente_id);
 <   ALTER TABLE ONLY public.servico DROP CONSTRAINT fk_cliente;
       public          postgres    false    224    3470    218            �           2606    16786 !   servico_peca fk_servico_peca_peca    FK CONSTRAINT     �   ALTER TABLE ONLY public.servico_peca
    ADD CONSTRAINT fk_servico_peca_peca FOREIGN KEY (peca_id) REFERENCES public.peca(peca_id);
 K   ALTER TABLE ONLY public.servico_peca DROP CONSTRAINT fk_servico_peca_peca;
       public          postgres    false    225    222    3475            �           2606    16791 $   servico_peca fk_servico_peca_servico    FK CONSTRAINT     �   ALTER TABLE ONLY public.servico_peca
    ADD CONSTRAINT fk_servico_peca_servico FOREIGN KEY (servico_id) REFERENCES public.servico(servico_id);
 N   ALTER TABLE ONLY public.servico_peca DROP CONSTRAINT fk_servico_peca_servico;
       public          postgres    false    225    3477    224            �           2606    16766    servico fk_usuario    FK CONSTRAINT     ~   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);
 <   ALTER TABLE ONLY public.servico DROP CONSTRAINT fk_usuario;
       public          postgres    false    3468    216    224            �           2606    16776    servico fk_veiculo    FK CONSTRAINT     ~   ALTER TABLE ONLY public.servico
    ADD CONSTRAINT fk_veiculo FOREIGN KEY (veiculo_id) REFERENCES public.veiculo(veiculo_id);
 <   ALTER TABLE ONLY public.servico DROP CONSTRAINT fk_veiculo;
       public          postgres    false    3473    224    220            �           2606    16797    veiculo fk_veiculo_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT fk_veiculo_cliente FOREIGN KEY (cliente_id) REFERENCES public.cliente(cliente_id) NOT VALID;
 D   ALTER TABLE ONLY public.veiculo DROP CONSTRAINT fk_veiculo_cliente;
       public          postgres    false    220    3470    218            0      x�3���/>�R!83�,�+F��� @x�      4   A   x�3�K�ITHIU�L��<����|Ns3=K.#N�Ҽ�T��sbR����%����z�&\1z\\\ 7R�      6   1   x�3�4C#=cΐ���D��T���|���������)�+F��� @�      7      x������ � �      .      x�3��M,�LT�O)�L/M-����� V��      2      x�3�1205�4����� ��     