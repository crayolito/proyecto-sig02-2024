// PGP = Punto Geografico Pasillo
import 'package:google_maps_flutter/google_maps_flutter.dart';

Map<String, LatLng> coordenadasPasillos = {
  'PGPBI': const LatLng(-17.78071029, -63.18985103),
  'PGPBF': const LatLng(-17.78071029, -63.18937633),
  'PGPCI': const LatLng(-17.78041762, -63.18942273),
  'PGPCF': const LatLng(-17.78041762, -63.1898546),
  'PGPAI': const LatLng(-17.78102438, -63.18914781),
  'PGPAF': const LatLng(-17.78102343, -63.18990638),
  'PGPDI': const LatLng(-17.78116239, -63.18945428),
  'PGPDF': const LatLng(-17.7803372, -63.18946475),
  'PGPEI': const LatLng(-17.78026962, -63.18977598),
  'PGPEF': const LatLng(-17.78107673, -63.18976837),
};

// PGMP = Punto Geografico para Marcador para el Pasillo
Map<String, LatLng> coordenadasMarkerPasillos = {
  'PGMPB': const LatLng(-17.78070029, -63.18961368),
  'PGMPC': const LatLng(-17.78040562, -63.18962067),
  'PGMPA': const LatLng(-17.78101391, -63.18962067),
  'PGMPD': const LatLng(-17.78085000, -63.18945952),
  'PGMPE': const LatLng(-17.78057000, -63.18977218),
};

// PGME = Punto Geografico para el Marcador de la Entrada
Map<String, LatLng> coordenadasMarkerEntrada = {
  'PGMEA': const LatLng(-17.78041643, -63.18985579),
  'PGMEB': const LatLng(-17.78027366, -63.18977441),
  'PGMEC': const LatLng(-17.78102462, -63.18914766),
  'PGMED': const LatLng(-17.78116168, -63.18945319),
  'PGMEE': const LatLng(-17.7810289, -63.18990433),
  'PGMEF': const LatLng(-17.78071031, -63.1898514),
  'PGMEG': const LatLng(-17.78033721, -63.18946992),
};

List<dynamic> DataProducts = [
  {
    "id": 1,
    "name": "Camiseta clásica",
    "description": "Camiseta de algodón suave y cómoda.",
    "price": 19.99,
    "size": "M",
    "image": "https://m.media-amazon.com/images/I/61n8hkNY5GL.jpg",
    "discount": 30,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 2,
    "name": "Zapatillas deportivas",
    "description": "Zapatillas para correr con tecnología avanzada.",
    "price": 59.99,
    "size": "US 9",
    "image":
        "https://i.pinimg.com/564x/eb/76/d7/eb76d7558b4fe02ddeb4bf4b2462d684.jpg",
    "discount": 10,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 3,
    "name": "Abrigo de invierno",
    "description": "Abrigo a prueba de viento y resistente al agua.",
    "price": 89.99,
    "size": "L",
    "image":
        "https://i.pinimg.com/564x/5a/41/bc/5a41bcaf7d1bfe97d86bd4d6e297f599.jpg",
    "discount": 11,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 4,
    "name": "Pantalones vaqueros",
    "description": "Vaqueros de corte moderno y ajuste cómodo.",
    "price": 49.99,
    "size": "32x34",
    "image":
        "https://i.pinimg.com/564x/a7/d8/7f/a7d87f4b33d4a6e1256238a19ecd1984.jpg",
    "discount": 15,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 5,
    "name": "Reloj inteligente",
    "description":
        "Reloj con monitor de actividad y notificaciones inteligentes.",
    "price": 129.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/eb/8e/75/eb8e7535bdee1ee387d1c3acf3a6c6ac.jpg",
    "discount": 15,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 6,
    "name": "Mochila resistente",
    "description": "Mochila con compartimentos y material duradero.",
    "price": 39.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/d9/cf/e0/d9cfe0127d25cab760d0b1a6de6b0292.jpg",
    "discount": 4,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 7,
    "name": "Botines de cuero",
    "description": "Botines elegantes de cuero genuino.",
    "price": 79.99,
    "size": "EUR 40",
    "image":
        "https://i.pinimg.com/564x/37/22/04/3722047551ebd8be2f7eccc533e6b973.jpg",
    "discount": 12,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 8,
    "name": "Gafas de sol polarizadas",
    "description": "Gafas de sol con protección UV y estilo moderno.",
    "price": 29.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/56/12/fe/5612fe30eb8ea635e08aa19b40d0d190.jpg",
    "discount": 10,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 9,
    "name": "Teclado mecánico para juegos",
    "description": "Teclado diseñado para jugadores con retroiluminación LED.",
    "price": 69.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/51/ad/03/51ad030be70b17dd894afef85aa06fa5.jpg",
    "discount": 8,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 10,
    "name": "Cámara digital compacta",
    "description": "Cámara con zoom óptico y funciones avanzadas.",
    "price": 249.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/77/fe/c7/77fec7beb0ac6df31ea41fb9918b881c.jpg",
    "discount": 9,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 11,
    "name": "Auriculares inalámbricos",
    "description": "Auriculares Bluetooth con cancelación de ruido.",
    "price": 99.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/b1/ed/9b/b1ed9b832ced92d86f7c08477650e5ec.jpg",
    "discount": 14,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 12,
    "name": "Silla ergonómica de oficina",
    "description": "Silla con ajuste lumbar y apoyabrazos ajustables.",
    "price": 159.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/61/5f/b3/615fb396e52f0e2f7048b0147e4cc2df.jpg",
    "discount": 4,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 13,
    "name": "Set de utensilios de cocina",
    "description": "Set de utensilios de acero inoxidable para cocina.",
    "price": 49.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/8a/64/1c/8a641c32ecd0c10d3a57fd61105e32f1.jpg",
    "discount": 9,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 14,
    "name": "Monitor de 27 pulgadas",
    "description": "Monitor LED con alta resolución y colores vibrantes.",
    "price": 299.99,
    "size": "27 pulgadas",
    "image":
        "https://i.pinimg.com/564x/01/18/8f/01188f54c98daf9f8663da0f1aeb8aa3.jpg",
    "discount": 8,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 15,
    "name": "Batería externa portátil",
    "description": "Batería con capacidad para cargar dispositivos múltiples.",
    "price": 34.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/736x/a3/7b/e0/a37be0b023e03e76d3fb308e92b33ecc.jpg",
    "discount": 5,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 16,
    "name": "Sudadera con capucha",
    "description": "Sudadera cómoda y abrigada con capucha.",
    "price": 44.99,
    "size": "L",
    "image":
        "https://i.pinimg.com/564x/d8/d2/a1/d8d2a1ecb120e2316a3a793b2a66f0b9.jpg",
    "discount": 5,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 17,
    "name": "Mouse gaming",
    "description": "Mouse ergonómico con botones programables.",
    "price": 49.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/e5/d9/43/e5d943131e935ac450445773613eb57f.jpg",
    "discount": 6,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 18,
    "name": "Cepillo eléctrico para dientes",
    "description": "Cepillo con tecnología sónica para una limpieza profunda.",
    "price": 39.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/38/31/fe/3831fe0994740c9a55e7b3851347a55d.jpg",
    "discount": 6,
    "createdAt": "2023-12-27T12:00:00Z"
  },
  {
    "id": 19,
    "name": "Bicicleta de montaña",
    "description": "Bicicleta todo terreno para aventuras al aire libre.",
    "price": 499.99,
    "size": "Único",
    "image":
        "https://i.pinimg.com/564x/f8/5e/f6/f85ef6c42eaa6683d73874dc22af7e49.jpg",
    "discount": 9,
    "createdAt": "2023-12-27T12:00:00Z"
  }
];
