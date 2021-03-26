class Hospital {
  String imageUrl;
  String name;
  String address;
  

  Hospital({
    this.imageUrl,
    this.name,
    this.address,
  });
}

final List<Hospital> hospitals = [
  Hospital(
    imageUrl: 'assets/images/image1.jpg',
    name: 'Itahari Medical',
    address: 'Itahari-8,Sunsari',
 
  ),
  Hospital(
    imageUrl: 'assets/images/image2.jpg',
    name: 'Itahari Medical',
    address: 'Itahari-1,Sunsari',
   
  ),
  Hospital(
    imageUrl: 'assets/images/image3.jpg',
    name: 'Samudhayak',
    address: 'Itahari-9,Sunsari',
    
  ),
];
