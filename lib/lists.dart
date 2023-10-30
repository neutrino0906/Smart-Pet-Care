class Lists{
  List<String> questions=[
    'Large ears?',
    'Itchy ears',
    'Hair loss around ear',
    'White discharge from ears',
    'Age is older than 3',
    'Tartar in teeth',
    'Excessive drooling',
    'Blood discharge from mouth',
    'Lumps inside mouth',
    'Excessive scratching',
    'Hair loss or Flaky skin',
    'Ticks',
    'Vomiting',
    'Excessive Vomiting',
    'Diarrhea',
    'Bloody/foul Diarrhea',
    'Cannot climb stairs easily',
    'Healthy weight',
    'Frequent Urination',
    'Bloody/foul urination',
    'Ribcage can be felt',
    'Loss of appetite',
    'Sudden weight loss',
    'Excess water consumption',
    'Fever',
    'Not vaccinated',
    'Frequent contact with other dogs',
    'Sudden Aggressiveness',
    'Preferring Dark places',
    'Lethargic',
  ];
  List<int> scores= List.generate(30, (index) => 0);
  List<String> dis(){
    List<String> ans=[];
    if(scores[0]+scores[1]+scores[2]+scores[3]>=3){
      ans.add('Ear infection');
      ans.add('Momentamax, Microzole, Keep ear clean and Dry');
    }
    if(scores[4]+scores[5]+scores[6]+scores[7]+scores[8]>=3){
      ans.add('Tooth infection');
      ans.add('Demisule, Clindramycin, Avoid giving sugary and fatty food');
    }
    if(scores[9]+scores[10]+scores[11]>=1){
      ans.add('Skin infection');
      ans.add('Cephalexin, Orerythromycin, Change diet of dog');
    }
    if(scores[16]+scores[17]==2){
      ans.add('Stifness');
      ans.add('Glucosamine, Chendroities, Lean diet');
    }
    if(scores[18]+scores[19]>=1){
      ans.add('Urinary Track infection');
      ans.add('Enrofloxacin, Orbifloxacin, Less moment');
    }
    if(scores[16]+scores[10]+scores[21]+scores[22]>=2){
      ans.add('Cancer');
      ans.add('Take to the vet immediately');
    }
    if(scores[23]+scores[9]+scores[11]+scores[12]>=2){
      ans.add('Diabetes');
      ans.add('Vetsulin, Caninsulin, Increase exercise');
    }
    if(scores[24]+scores[26]+scores[28]>=2){
      ans.add('Kennel Cough');
      ans.add('Vetnex, Honey water, Provide warm water ');
    }
    if(scores[26]+scores[13]+scores[21]+scores[15]+scores[25]>=4){
      ans.add('Parvo Virus');
      ans.add('Take to the vet immediately');
    }
    if(scores[27]+scores[28]+scores[29]+scores[6]+scores[21]>=3){
      ans.add('Rabies');
      ans.add('Take to the vet immediately');
    }
    if(scores[0]+scores[1]+scores[2]+scores[3]>=3){
      ans.add('Ear infection');
      ans.add('Momentamax, Microzole, Keep ear clean and Dry');
    }
    if(scores[11]==1 && scores[4]==0 && scores[26]==1){
      ans.add('Ringworm');
      ans.add('Cephalexin, Clindarycin, ');
    }
    return ans;
  }

}