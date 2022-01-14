const { ref, onBeforeUnmount } = Vue

const app = Vue.createApp({
  data: function() {
		return {
			isOutMapChecked: this.initIsOutMapChecked(),
      isOpenMenuSoundsChecked: this.initIsOpenMenuSoundsChecked(),
      isResetSoundsChecked: this.initIsResetSoundsChecked(),
      isListSoundsChecked: this.initIsListSoundsChecked(),
      isMapNotifChecked: this.initIsMapNotifChecked(),
      isLowFuelChecked: this.initIsLowFuelChecked(),
      isCinematicNotifChecked: this.initIsCinematicNotifChecked(),
      isDynamicHealthChecked: this.initIsDynamicHealthChecked(),
      isDynamicArmorChecked: this.initIsDynamicArmorChecked(),
      isDynamicHungerChecked: this.initIsDynamicHungerChecked(),
      isDynamicThirstChecked: this.initIsDynamicThirstChecked(),
      isDynamicStressChecked: this.initIsDynamicStressChecked(),
      isDynamicOxygenChecked: this.initIsDynamicOxygenChecked(),
      isChangeFPSChecked: this.initIsChangeFPSChecked(),
      isToggleMapShapeChecked: this.initIsToggleMapShapeChecked(),
      isHideMapChecked: this.initIsHideMapChecked(),
      isToggleMapBordersChecked: this.initIsToggleMapBordersChecked(),
      isDynamicEngineChecked: this.initIsDynamicEngineChecked(),
      isDynamicNitroChecked: this.initIsDynamicNitroChecked(),
      isHideCompassChecked: this.initIsHideCompassChecked(),
      isHideStreetsChecked: this.initIsHideStreetsChecked(),
      isCineamticModeChecked: this.initIsCineamticModeChecked(),
		};
	},
  setup () {
    const progress = ref([
      { loading: false, percentage: 0 },
      { loading: false, percentage: 0 },
      { loading: false, percentage: 0 }
    ])
    
    const intervals = [ null, null, null ]

    function startComputing (id) {
      progress.value[ id ].loading = true
      progress.value[ id ].percentage = 0

      intervals[ id ] = setInterval(() => {
        progress.value[ id ].percentage += Math.floor(Math.random() * 8 + 10)
        if (progress.value[ id ].percentage >= 100) {
          clearInterval(intervals[ id ])
          progress.value[ id ].loading = false
        }
      }, 700)
    }

    onBeforeUnmount(() => {
      intervals.forEach(val => {
        clearInterval(val)
      })
    }) 
    return {
      framework: {
        plugins: [
          'LocalStorage',
          'SessionStorage'
        ]
      },
      tab: ref('hud'),
      splitterModel: ref(20),
      selection: ref([]),
      progress,
      startComputing,
    }
  },
  watch: {
    isOutMapChecked: function() {
			localStorage.setItem("isOutMapChecked", this.isOutMapChecked);
		},
    isOpenMenuSoundsChecked: function() {
			localStorage.setItem("isOpenMenuSoundsChecked", this.isOpenMenuSoundsChecked);
		},
    isResetSoundsChecked: function() {
			localStorage.setItem("isResetSoundsChecked", this.isResetSoundsChecked);
		},
    isListSoundsChecked: function() {
			localStorage.setItem("isListSoundsChecked", this.isListSoundsChecked);
		},
    isMapNotifChecked: function() {
			localStorage.setItem("isMapNotifChecked", this.isMapNotifChecked);
		},
    isLowFuelChecked: function() {
			localStorage.setItem("isLowFuelChecked", this.isLowFuelChecked);
		},
    isCinematicNotifChecked: function() {
			localStorage.setItem("isCinematicNotifChecked", this.isCinematicNotifChecked);
		},
    isDynamicHealthChecked: function() {
			localStorage.setItem("isDynamicHealthChecked", this.isDynamicHealthChecked);
		},
    isDynamicArmorChecked: function() {
			localStorage.setItem("isDynamicArmorChecked", this.isDynamicArmorChecked);
		},
    isDynamicHungerChecked: function() {
			localStorage.setItem("isDynamicHungerChecked", this.isDynamicHungerChecked);
		},
    isDynamicThirstChecked: function() {
			localStorage.setItem("isDynamicThirstChecked", this.isDynamicThirstChecked);
		},
    isDynamicStressChecked: function() {
			localStorage.setItem("isDynamicStressChecked", this.isDynamicStressChecked);
		},
    isDynamicOxygenChecked: function() {
			localStorage.setItem("isDynamicOxygenChecked", this.isDynamicOxygenChecked);
		},
    isChangeFPSChecked: function() {
			localStorage.setItem("isChangeFPSChecked", this.isChangeFPSChecked);
		},
    isToggleMapShapeChecked: function() {
			localStorage.setItem("isToggleMapShapeChecked", this.isToggleMapShapeChecked);
		},
    isHideMapChecked: function() {
			localStorage.setItem("isHideMapChecked", this.isHideMapChecked);
		},
    isToggleMapBordersChecked: function() {
			localStorage.setItem("isToggleMapBordersChecked", this.isToggleMapBordersChecked);
		},
    isDynamicEngineChecked: function() {
			localStorage.setItem("isDynamicEngineChecked", this.isDynamicEngineChecked);
		},
    isDynamicNitroChecked: function() {
			localStorage.setItem("isDynamicNitroChecked", this.isDynamicNitroChecked);
		},
    isHideCompassChecked: function() {
			localStorage.setItem("isHideCompassChecked", this.isHideCompassChecked);
		},
    isHideStreetsChecked: function() {
			localStorage.setItem("isHideStreetsChecked", this.isHideStreetsChecked);
		},
    isCineamticModeChecked: function() {
			localStorage.setItem("isCineamticModeChecked", this.isCineamticModeChecked);
		},
	},
  methods: {
    initIsOutMapChecked: function() {
			const stored = localStorage.getItem("isOutMapChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsOpenMenuSoundsChecked: function() {
			const stored = localStorage.getItem("isOpenMenuSoundsChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsResetSoundsChecked: function() {
			const stored = localStorage.getItem("isResetSoundsChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsListSoundsChecked: function() {
			const stored = localStorage.getItem("isListSoundsChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsMapNotifChecked: function() {
			const stored = localStorage.getItem("isMapNotifChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsLowFuelChecked: function() {
			const stored = localStorage.getItem("isLowFuelChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsCinematicNotifChecked: function() {
			const stored = localStorage.getItem("isCinematicNotifChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicHealthChecked: function() {
			const stored = localStorage.getItem("isDynamicHealthChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicArmorChecked: function() {
			const stored = localStorage.getItem("isDynamicArmorChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicHungerChecked: function() {
			const stored = localStorage.getItem("isDynamicHungerChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicThirstChecked: function() {
			const stored = localStorage.getItem("isDynamicThirstChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicStressChecked: function() {
			const stored = localStorage.getItem("isDynamicStressChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicOxygenChecked: function() {
			const stored = localStorage.getItem("isDynamicOxygenChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsChangeFPSChecked: function() {
			const stored = localStorage.getItem("isChangeFPSChecked");
			if (stored === null) {
				return 'Optimized';
			} else {
				return stored;
			}
		}, 
    initIsToggleMapShapeChecked: function() {
			const stored = localStorage.getItem("isToggleMapShapeChecked");
			if (stored === null) {
				return 'Circle';
			} else {
				return stored;
			}
		},
    initIsHideMapChecked: function() {
			const stored = localStorage.getItem("isHideMapChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsToggleMapBordersChecked: function() {
			const stored = localStorage.getItem("isToggleMapBordersChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicEngineChecked: function() {
			const stored = localStorage.getItem("isDynamicEngineChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsDynamicNitroChecked: function() {
			const stored = localStorage.getItem("isDynamicNitroChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    initIsHideCompassChecked: function() {
			const stored = localStorage.getItem("isHideCompassChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsHideStreetsChecked: function() {
			const stored = localStorage.getItem("isHideStreetsChecked");
			if (stored === null) {
				return true;
			} else {
				return stored == 'true';
			}
		},
    initIsCineamticModeChecked: function() {
			const stored = localStorage.getItem("isCineamticModeChecked");
			if (stored === null) {
				return false;
			} else {
				return stored == 'true';
			}
		},
    resetStorage: function(event) {
      targetId = event.currentTarget.id;
      localStorage.clear();
      resetStorage()
    },
    restartHud: function(event) {
      targetId = event.currentTarget.id;
      restartHud()
    },
    showOutMap: function(event) {
      targetId = event.currentTarget.id;
      showOutMap()
    },
    openMenuSounds: function(event) {
      targetId = event.currentTarget.id;
      openMenuSounds()
    },
    resetHudSounds: function(event) {
      targetId = event.currentTarget.id;
      resetHudSounds()
    },
    checklistSounds: function(event) {
      targetId = event.currentTarget.id;
      checklistSounds()
    },
    showMapNotif: function(event) {
      targetId = event.currentTarget.id;
      showMapNotif()
    },
    showFuelAlert: function(event) {
      targetId = event.currentTarget.id;
      showFuelAlert()
    },
    showCinematicNotif: function(event) {
      targetId = event.currentTarget.id;
      showCinematicNotif()
    },
    dynamicHealth: function(event) {
      targetId = event.currentTarget.id;
      dynamicHealth()
    },
    dynamicArmor: function(event) {
      targetId = event.currentTarget.id;
      dynamicArmor()
    },
    dynamicHunger: function(event) {
      targetId = event.currentTarget.id;
      dynamicHunger()
    },
    dynamicThirst: function(event) {
      targetId = event.currentTarget.id;
      dynamicThirst()
    },
    dynamicStress: function(event) {
      targetId = event.currentTarget.id;
      dynamicStress()
    },
    dynamicOxygen: function(event) {
      targetId = event.currentTarget.id;
      dynamicOxygen()
    },
    changeFPS: function(event) {
      targetId = event.currentTarget.id;
      changeFPS()
    },
    ToggleMapShape: function(event) {
      targetId = event.currentTarget.id;
      ToggleMapShape()
    },
    HideMap: function(event) {
      targetId = event.currentTarget.id;
      HideMap()
    },
    ToggleMapBorders: function(event) {
      targetId = event.currentTarget.id;
      ToggleMapBorders()
    },
    dynamicEngine: function(event) {
      targetId = event.currentTarget.id;
      dynamicEngine()
    },
    dynamicNitro: function(event) {
      targetId = event.currentTarget.id;
      dynamicNitro()
    },
    HideCompass: function(event) {
      targetId = event.currentTarget.id;
      HideCompass()
    },
    HideStreets: function(event) {
      targetId = event.currentTarget.id;
      HideStreets()
    },
    cinematicMode: function(event) {
      targetId = event.currentTarget.id;
      cinematicMode()
    },
  },
  mounted() {
    this.listener = window.addEventListener("message", (event) => {
        if (event.data.event === 'isHideCompassChecked'){
          HideCompass(event.data.toggle)
        }else if (event.data.event === 'isHideStreetsChecked'){
          HideStreets(event.data.toggle)
        }else if (event.data.event === 'isToggleMapShapeChecked' || event.data.event === 'isChangeFPSChecked') {
          eval(`this.${event.data.event} = "${event.data.toggle}"`)
        }
    });
  },
})

app.use(Quasar, { config: {} })
app.mount('#menu')

document.onkeyup = function (data) {
  if (data.key == 'Escape') {
    closeMenu()
  }
};

function closeMenu() {
  $("#openmenu").fadeOut(550);
  $.post('https://qb-hud/closeMenu');
}
function restartHud() {
  closeMenu()
  $.post('https://qb-hud/restartHud');
}
function resetStorage() {
  closeMenu()
  $.post('https://qb-hud/resetStorage');
}
function showOutMap() {
  $.post('https://qb-hud/showOutMap');
}
function showBrand() {
  $.post('https://lj-brand/showBrand');
}
function openMenuSounds() {
  $.post('https://qb-hud/openMenuSounds');
}
function resetHudSounds() {
  $.post('https://qb-hud/resetHudSounds');
}
function checklistSounds() {
  $.post('https://qb-hud/checklistSounds');
}
function showMapNotif() {
  $.post('https://qb-hud/showMapNotif');
}
function showFuelAlert() {
  $.post('https://qb-hud/showFuelAlert');
}
function showCinematicNotif() {
  $.post('https://qb-hud/showCinematicNotif');
}
function dynamicHealth() {
  $.post('https://qb-hud/dynamicHealth');
}
function dynamicArmor() {
  $.post('https://qb-hud/dynamicArmor');
}
function dynamicHunger() {
  $.post('https://qb-hud/dynamicHunger');
}
function dynamicThirst() {
  $.post('https://qb-hud/dynamicThirst');
}
function dynamicStress() {
  $.post('https://qb-hud/dynamicStress');
}
function dynamicOxygen() {
  $.post('https://qb-hud/dynamicOxygen');
}
function dynamicEngine() {
  $.post('https://qb-hud/dynamicEngine');
}
function dynamicNitro() {
  $.post('https://qb-hud/dynamicNitro');
}
function ToggleMapShape() {
  $.post('https://qb-hud/ToggleMapShape');
}
function changeFPS() {
  $.post('https://qb-hud/changeFPS');
}
function ToggleMapBorders() {
  $.post('https://qb-hud/ToggleMapBorders');
}
function HideMap() {
  $.post('https://qb-hud/HideMap');
}
function HideCompass() {
  $.post('https://lj-compass/HideCompass');
}
function HideStreets() {
  $.post('https://lj-compass/HideStreets');
}
function cinematicMode() {
  $.post('https://qb-hud/cinematicMode');
}

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    switch (event.data.action) {
    case "open":
      Open(event.data);
      break;
    }
  });
});

Open = function (data) {
  $("#openmenu").fadeIn(150);
}
$('.closeMenu').click(() => {
  closeMenu()
});

// MONEY HUD

const moneyHud = Vue.createApp({
  data() {
    return {
      cash: 0,
      bank: 0,
      amount: 0,
      plus: false,
      minus: false,
      showCash: false,
      showBank: false,
      showUpdate: false,
    };
  },
  destroyed() {
    window.removeEventListener("message", this.listener);
  },
  mounted() {
    this.listener = window.addEventListener("message", (event) => {
      switch (event.data.action) {
        case "showconstant":
          this.showConstant(event.data);
          break;
        case "update":
          this.update(event.data);
          break;
        case "show":
          this.showAccounts(event.data);
          break;
      }
    });
  },
  methods: {
    // CONFIGURE YOUR CURRENCY HERE
    // https://www.w3schools.com/tags/ref_language_codes.asp LANGUAGE CODES
    // https://www.w3schools.com/tags/ref_country_codes.asp COUNTRY CODES
    formatMoney(value) {
      const formatter = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "USD",
        minimumFractionDigits: 0,
      });
      return formatter.format(value);
    },
    showConstant(data) {
      this.showCash = true;
      this.showBank = true;
      this.cash = data.cash;
      this.bank = data.bank;
    },
    update(data) {
      this.showUpdate = true;
      this.amount = data.amount;
      this.bank = data.bank;
      this.cash = data.cash;
      this.minus = data.minus;
      this.plus = data.plus;
      if (data.type === "cash") {
        if (data.minus) {
          this.showCash = true;
          this.minus = true;
          setTimeout(() => (this.showUpdate = false), 1000);
          setTimeout(() => (this.showCash = false), 2000);
        } else {
          this.showCash = true;
          this.plus = true;
          setTimeout(() => (this.showUpdate = false), 1000);
          setTimeout(() => (this.showCash = false), 2000);
        }
      }
      if (data.type === "bank") {
        if (data.minus) {
          this.showBank = true;
          this.minus = true;
          setTimeout(() => (this.showUpdate = false), 1000);
          setTimeout(() => (this.showBank = false), 2000);
        } else {
          this.showBank = true;
          this.plus = true;
          setTimeout(() => (this.showUpdate = false), 1000);
          setTimeout(() => (this.showBank = false), 2000);
        }
      }
    },
    showAccounts(data) {
      if (data.type === "cash" && !this.showCash) {
        this.showCash = true;
        this.cash = data.cash;
        setTimeout(() => (this.showCash = false), 3500);
      } else if (data.type === "bank" && !this.showBank) {
        this.showBank = true;
        this.bank = data.bank;
        setTimeout(() => (this.showBank = false), 3500);
      }
    },
  },
}).mount("#money-container");

// PLAYER HUD

const playerHud = {
  data() {
    return {
      dynamicHealth: 0,
      dynamicHunger: 0,
      dynamicThirst: 0,
      dynamicStress: 0,
      dynamicOxygen: 0,
      dynamicEngine: 0,
      dynamicNitro: 0,
      nos: 0,
      static: 100,
      health: 0,
      playerDead: 0,
      armor: 0,
      hunger: 0,
      thirst: 0,
      stress: 0,
      voice: 0,
      radio: 0,
      harness: 0,
      nitroActive: 0,
      cruise: 0,
      parachute: 0,
      oxygen: 0,
      hp: 0,
      armed: 0,
      speed: 0,
      engine: 0,
      cinematic: 0,
      dev: 0,
      show: false,
      talking: false,
      showVoice: true,
      showHealth: false,
      showArmor: true,
      showHunger: true,
      showThirst: true,
      showNos: true,
      showStress: true,
      showOxygen: false,
      showArmed: true,
      showEngine: false,
      showCruise: false,
      showHarness: false,
      showParachute: false,
      showDev: false,
      voiceIcon: "fas fa-microphone",
      talkingColor: "#FFFFFF",
      nosColor: "",
      engineColor: "",
      armorColor: "",
      hungerColor: "",
      healthColor: "",
      thirstColor: "",
    };
  },
  
  destroyed() {
    window.removeEventListener("message", this.listener);
  },
  mounted() {
    this.listener = window.addEventListener("message", (event) => {
      if (event.data.action === "hudtick") {
        this.hudTick(event.data);
      } 
      // else if(event.data.update) {
      //   eval(event.data.action + "(" + event.data.show + ')')
      // }
    });
    Config = {};
  },
  methods: {
    hudTick(data) {
      this.show = data.show;
      this.health = data.health;
      this.armor = data.armor;
      this.hunger = data.hunger;
      this.thirst = data.thirst;
      this.stress = data.stress;
      this.voice = data.voice;
      this.talking = data.talking;
      this.radio = data.radio;
      this.nos = data.nos;
      this.oxygen = data.oxygen;
      this.cruise = data.cruise;
      this.nitroActive = data.nitroActive;
      this.harness = data.harness;
      this.speed = data.speed;
      this.armed = data.armed;
      this.parachute = data.parachute;
      this.hp = data.hp*5;
      this.engine = data.engine;
      this.cinematic = data.cinematic;
      this.dev = data.dev;
      this.playerDead = data.playerDead;
      this.dynamicHealth = data.dynamicHealth;
      this.dynamicArmor = data.dynamicArmor;
      this.dynamicHunger = data.dynamicHunger;
      this.dynamicThirst = data.dynamicThirst;
      this.dynamicStress = data.dynamicStress;
      this.dynamicOxygen = data.dynamicOxygen;
      this.dynamicEngine = data.dynamicEngine;
      this.dynamicNitro = data.dynamicNitro;

      if (data.dynamicHealth == true) {
        if (data.health >= 100) {
          this.showHealth = false; }
          else{
            this.showHealth = true;
          }
      } else if (data.dynamicHealth == false){
        this.showHealth = true;
      } 
      if (data.playerDead === false) {
        this.healthColor = "#3FA554";
      } else {
        this.healthColor = "#ff0000";
        this.health = 100;
      }

      if (data.dynamicArmor == true) {
        if (data.armor == 0) {
          this.showArmor = false; 
        }  else {
            this.showArmor = true;
          }
      } else if (data.dynamicArmor == false){
        this.showArmor = true;
      } 

      if (data.armor <= 0) {
        this.armorColor = "#FF0000";
      } else {
        this.armorColor = "#326dbf";
      }

      if (data.dynamicHunger == true) {
        if (data.hunger >= 100) {
          this.showHunger = false; }
          else{
            this.showHunger = true;
          }
      } else if (data.dynamicHunger == false){
        this.showHunger = true;
      } 
      if (data.hunger >= 100) {
        this.hungerColor = "#dd6e14";
      } else if(data.hunger <= 30){
        this.hungerColor = "#ff0000";
      } else{
        this.hungerColor = "#dd6e14";
      }

      if (data.dynamicThirst == true) {
        if (data.thirst >= 100) {
          this.showThirst = false; }
          else{
            this.showThirst = true;
          }
      } else if (data.dynamicThirst == false){
        this.showThirst = true;
      } 
      if (data.thirst >= 100) {
        this.thirstColor = "#1a7cad";
      } else if(data.thirst <= 30){
        this.thirstColor = "#ff0000";
      } else{
        this.thirstColor = "#1a7cad";
      }

      if (data.dynamicStress == true) {
        if (data.stress == 0) {
          this.showStress = false; 
        }  else {
            this.showStress = true;
          }
      } else if (data.dynamicStress == false){
        this.showStress = true;
      } 

      if (data.dynamicOxygen == true) {
        if (data.oxygen >= 100) {
          this.showOxygen = false; }
          else{
            this.showOxygen = true;
          }
      } else if (data.dynamicOxygen == false){
        this.showOxygen = true;
      } 

      if (data.dynamicEngine == true) {
        if (data.engine >= 95) {
          this.showEngine = false; 
        } else if  (data.engine < 0){
          this.showEngine = false;} else {this.showEngine = true;}
      } else if (data.dynamicEngine == false){
        if  (data.engine < 0) {
          this.showEngine = false;} else {this.showEngine = true;}
      } 
      if (data.engine <= 45) {
        this.engineColor = "#ff0000";
      } else if (data.engine <= 75 && data.engine >= 46 ) {
        this.engineColor = "#dd6e14";
      } else if(data.engine<=100) {
        this.engineColor = "#3FA554";
      } 

      if (data.dynamicNitro == true) {
      if (data.nos === 0 || data.nos === undefined) {
        this.showNos = false;
      } else if  (data.nos < 0){
        this.showNos = false;} else {this.showNos = true;}  
      } else if  (data.dynamicNitro == false)  {
        if  (data.nos < 0){
          this.showNos = false;
      } else {this.showNos = true;}
      }
      if (data.nitroActive) {
        this.nosColor = "#D64763";
      } else {
        this.nosColor = "#FFFFFF";
      }

      if (data.talking && data.radio) {
        this.talkingColor = "#D64763";
      } else if (data.talking) {
        this.talkingColor = '#FFFF3E';
      } else {
        this.talkingColor = "#FFFFFF";
      }
      if (data.radio != 0 && data.radio != undefined) {
        this.voiceIcon = 'fas fa-headset';
      } else if (data.radio == 0 || data.radio == undefined) {
        this.voiceIcon = 'fas fa-microphone';
      }
      if (data.cruise === true) {
        this.cruise = 1;
        this.showCruise = true;
      } else {
        this.cruise = 0;
        this.showCruise = false;
      }

      if (data.harness === true) {
        this.showHarness = true;
      } else {
        this.showHarness = false;
      }
      if (data.armed === true) {
        this.showArmed = true;
      } else {
        this.showArmed = false;
      }

      if (data.parachute >= 0 ) {
        this.showParachute = true;
      } else {
        this.showParachute = false;
      }

      if (data.dev === true ) {
        this.showDev = true;
      } else {
        this.showDev = false;
      }

      if (data.isPaused === 1) {
        this.show = false;
      }
    },
  },
};
const app2 = Vue.createApp(playerHud);
app2.use(Quasar);
app2.mount("#ui-container");

// VEHICLE HUD

const vehHud = {
  data() {
    return {
      speedometer: 66,
      fuelgauge: 69,
      altitudegauge: 75,
      fuel: 0,
      speed: 0,
      seatbelt: 0,
      showSquareB: 0,
      show: false,
      showAltitude: true,
      showSeatbelt: true,
      showSquare: false,
      showCircle: false,
      seatbeltColor: "",
    };
  },
  
  destroyed() {
    window.removeEventListener("message", this.listener);
  },
  mounted() {
    this.listener = window.addEventListener("message", (event) => {
      if (event.data.action === "car") {
        this.vehicleHud(event.data);
      }
    });
  },
  methods: {
    vehicleHud(data) {
      this.show = data.show;
      this.speed = data.speed;
      this.altitude = data.altitude;
      this.fuel = (data.fuel * 0.71);
      this.showSeatbelt = data.showSeatbelt;
      this.showAltitude = data.showAltitude;
      this.showSquareB = data.showSquareB;
      this.showCircleB = data.showCircleB;
      if (data.seatbelt === true) {
        this.seatbelt = 1;
        this.seatbeltColor = "transparent";
      } else {
        this.seatbelt = 0;
        this.seatbeltColor = "#FF5100";
      }
      if (data.showSeatbelt === true) {
        this.showSeatbelt = true;
      } else {
        this.showSeatbelt = false;
      }
      if (data.showAltitude === true) {
        this.showAltitude = true;
      } else {
        this.showAltitude = false;
      }
      if (data.fuel <= 20) {
        this.fuelColor = "#ff0000";
      } else if (data.fuel <= 30) {
        this.fuelColor = "#dd6e14";
      } else {
        this.fuelColor = "#FFFFFF";
      }
      if (data.showSquareB === true) {
        this.showSquare = true;
      } else {
        this.showSquare = false;
      }
      if (data.showCircleB === true) {
        this.showCircle = true;
      } else {
        this.showCircle = false;
      }
      if (data.isPaused === 1) {
        this.show = false;
      }
    },
  },
};
const app3 = Vue.createApp(vehHud);
app3.use(Quasar);
app3.mount("#veh-container");
