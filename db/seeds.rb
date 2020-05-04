meat = ["焼肉", "唐揚げ", "とんかつ", "ケバブ", "ジンギスカン", "ハンバーグ", "牛丼", "ビーフシチュー", "餃子", "親子丼"]
fish = ["焼きサバ", "焼鮭", "ぶりの照り焼き", "刺身", "カレイの煮付け", "寿司", "白身魚のフライ", "うなぎ", "海鮮丼", "エビフライ"]
vege = ["コブサラダ", "シーザーサラダ", "コンソメ野菜スープ", "ポテトサラダ", "ピザ", "無限キャベツ", "無限もやし", "かぼちゃの煮物", "フライドポト", "麻婆茄子"]
noodle = ["醤油ラーメン", "塩ラーメン", "味噌ラーメン", "醤油豚骨ラーメン", "豚骨ラーメン", "つけ麺", "油そば", "ミートソーススパゲティ", "ラザニア", "刀削麺"]

meat.each do |n|
  Food.create!(
    name: n,
    category: :"肉")
end

fish.each do |n|
  Food.create!(
    name: n,
    category: :"魚")
end

vege.each do |n|
  Food.create!(
    name: n,
    category: :"野菜")
end

noodle.each do |n|
  Food.create!(
    name: n,
    category: :"麺")
end