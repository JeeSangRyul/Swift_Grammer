
let skeleton = Enemy(health: 3, attackStrength: 4)
let skeleton2 = skeleton //class는 skeleton의 주소를 넘겨주기 때문에 skeleton의 값이 변화되면 skeleton2의 값도 변화된다.

skeleton2.takeDamage(amount: 10)

print(skeleton2.health)

//let dragon = Dragon(health: 50, attackStrength: 49)
//dragon.wingSpan = 5
//dragon.attackStrength = 15
//dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are a hurricane")
//dragon.move()
//dragon.attack()
