# This file is maintained automatically by "tofu init".
# Manual edits may be lost in future updates.

provider "registry.opentofu.org/bpg/proxmox" {
  version     = "0.74.0"
  constraints = "~> 0.0, >= 0.60.0"
  hashes = [
    "h1:DFKKNMDOq1NhSt47gkVZ7ixrsvBAfYfANgIeiVUgvZI=",
    "zh:2bab64cc0fa21947367d10e50583840693afd1d32359bb574a45d0db5fb25db7",
    "zh:37d95e128667d6dafcbd53d667cecae5f758f2a08f96f28de10e644dd66d8387",
    "zh:6c1494fd586c9038bc36195c5c66e2cc029dbca43a24bc13a46197f70e309c20",
    "zh:6f37c963ff3206b1f8861e3884dca7014769125cd3c7f962cd8656415f8ef2f2",
    "zh:73e6b1e0f0a6a64913afb1ce27a26e7fee69d19b2d43a9d0aa5111c077082fda",
    "zh:93e50c7fdf723c034cfa1ac915eb157e8d64a8b91df5f7d7a5ab3f0b3faafa8a",
    "zh:93e539f35669f132357e3c7798ea5f829945dd4e0b416875f0e19d34fdfc46d0",
    "zh:b09c655e39df59f280811a1a05ab1d007e435887a58dd0f0333f7bd728a1d22d",
    "zh:b0ad6daf34b6e1475ce6e1c9439af64d632897a46c21895e0a73b8329321d687",
    "zh:b1438f112d91a6128ebc9c968fd56753809a60bce3b7d8effe3f0c49826b1308",
    "zh:b215dd5e9f0c7778993b76aae44f98d07a6f87cf0c54f95f3c8b117cad7668e0",
    "zh:d960acd736637736d06433cc30f0f0e65024bbaaadaa04b86d7a3eca3fe49851",
    "zh:f26e0763dbe6a6b2195c94b44696f2110f7f55433dc142839be16b9697fa5597",
    "zh:fe8d3fd41a662cafc0b2484f567447a5a78543f1d93bca11b9bff1e5b376ab80",
    "zh:ff9dbb8cd84f2ac6282f00e159db44c79551afba07dfb5d54a83d9a0458299fe",
  ]
}

provider "registry.opentofu.org/hashicorp/helm" {
  version     = "3.0.0-pre2"
  constraints = "3.0.0-pre2"
  hashes = [
    "h1:9lyuKApnwfKwBk93S300VrrSeZjCClF3EafrPyCtw1w=",
    "zh:1c3a224a852c64bb8c8e0652e7770c61d519be66ee9b43ebddfa1f9f64e6e151",
    "zh:2200e69ed1aec5eb81d3d6dfaa9d3320ff1c7711decdb7541f85ef8d58137061",
    "zh:24631b42f12073c09017a25d3bf80c834f540356906e2d80e042b1c74b691c78",
    "zh:40049716eabcb5f35e9f36dff28ea37b2f9b9af9c146d294534df8c71f017f16",
    "zh:ac73793368929f8639910a5905a1cc12a8c35abf21ee27652afd7efa2c8fc49a",
    "zh:adb38561c51d9c159d9db2dc9f4186b1371461805bb1907cfce4faa8057a084c",
    "zh:b1284f32ef9fb687ca1e25c720baa9efd77be4a593918c4c71b42c5e26702f40",
    "zh:e419c10ec74e9b8ec00eddf3cb8ec89c9f1d87d0631541cf333199841bb9f38e",
    "zh:f6cf2384efcdbef574a70d89cc8314804c3c7a1a24b9bdf3c5ef3092727a8b1e",
    "zh:ffbf99d742a3b866eca81fa5c1742265293c545b225f389ffab604459cb1f225",
  ]
}

provider "registry.opentofu.org/hashicorp/http" {
  version = "3.4.5"
  hashes = [
    "h1:IkHNZ09hqg1TtLrUqUHIqoKXbNJE69dk917niblQf3U=",
    "zh:055a4431d33bb89b9848193152433eaead7cc2e6746d3436a5922419de2112bf",
    "zh:0bfabafea9f5e36802fcfc5a800831ec1767d896af889abc610014d02b09bdc2",
    "zh:300b4983fe1b43bd0a7dac1f94b30b3814f11c824224dd83fb45a521c02cea60",
    "zh:68f6958314ca5dc0868be70e37ec123b99b8828aa49f27fd2fdd13df05d31ab1",
    "zh:c29f098a597250adc2a7d9f99acbce3c9e07d37f1c5cfded5df4309738cf613c",
    "zh:c33607397f9c9302c0cd797c8b7484c9c6cfa09c3489d4b55af17df20b204368",
    "zh:d519ca364a224110428b390ee06e963a3ec4dfdd1ac816c9f32e647567957cf5",
    "zh:e4a9c7c0ac31a0192362ef43449390cdf00d2cf6f13061ef730b177eaf00ac45",
    "zh:f25223c062f274d8f89bb96017e73586030a205bc91cdad266a9954d0def2a23",
    "zh:fd4dc824ebae2f3a66318df364bec83b88e9a52e7f66b00dafa29a796d9a94ab",
  ]
}

provider "registry.opentofu.org/hashicorp/kubernetes" {
  version     = "2.36.0"
  constraints = "~> 2.0, >= 2.31.0"
  hashes = [
    "h1:eHxAqiBgRe3rEy9aXtOrW/kEr33cyXBonseKSDdXwlw=",
    "zh:15e42a6f8c6be77e0266edfb3765065c01e8fbcc8d75c794f1442f39cd9e6cfb",
    "zh:2387195e7c80bc3ba93162c5c755482828b309a275d170e0c329145894dc6cb2",
    "zh:27775d6f0b53a76c3f91689e553461a10ab2e07f7066ccb7cc0dce2cb8abf72f",
    "zh:28e77e1dfafe5881bc28bec76e22735e4be2dcde468a8f3f08f32a52c6f1938e",
    "zh:89b6571d33b6607499683b7b1fdfb95576ed08ab80539537c5460de1455df424",
    "zh:91cdad0f3a5cb4a82669703f6f017b07e434748cff9b8991432043c733ae50a7",
    "zh:a566611bc563c4e8ac843f6b6b868cf8dce2eccb908bd7605040b553983dc5e3",
    "zh:d4efb26732e5fbd4e6a5e4c10eea62628d669c9c76e52c6485417c1e0a60fd99",
    "zh:e87d8edc93920b75b88e7fb8d1a7941f2b7facc89931b72e4c74fcf137baee91",
    "zh:f173c9c66edb046715db10adce1d603fe989a3634b26bb81d556de3de548bd94",
  ]
}

provider "registry.opentofu.org/hashicorp/local" {
  version = "2.5.2"
  hashes = [
    "h1:6lS+5A/4WFAqY3/RHWFRBSiFVLPRjvLaUgxPQvjXLHU=",
    "zh:25b95b76ceaa62b5c95f6de2fa6e6242edbf51e7fc6c057b7f7101aa4081f64f",
    "zh:3c974fdf6b42ca6f93309cf50951f345bfc5726ec6013b8832bcd3be0eb3429e",
    "zh:5de843bf6d903f5cca97ce1061e2e06b6441985c68d013eabd738a9e4b828278",
    "zh:86beead37c7b4f149a54d2ae633c99ff92159c748acea93ff0f3603d6b4c9f4f",
    "zh:8e52e81d3dc50c3f79305d257da7fde7af634fed65e6ab5b8e214166784a720e",
    "zh:9882f444c087c69559873b2d72eec406a40ede21acb5ac334d6563bf3a2387df",
    "zh:a4484193d110da4a06c7bffc44cc6b61d3b5e881cd51df2a83fdda1a36ea25d2",
    "zh:a53342426d173e29d8ee3106cb68abecdf4be301a3f6589e4e8d42015befa7da",
    "zh:d25ef2aef6a9004363fc6db80305d30673fc1f7dd0b980d41d863b12dacd382a",
    "zh:fa2d522fb323e2121f65b79709fd596514b293d816a1d969af8f72d108888e4c",
  ]
}

provider "registry.opentofu.org/mastercard/restapi" {
  version     = "1.20.0"
  constraints = "~> 1.0"
  hashes = [
    "h1:mYyaOCD0iu+7i3OQPudY39PHh3Qxe3nkIJefVWWPEXw=",
    "zh:1c3e89cf19118fc07d7b04257251fc9897e722c16e0a0df7b07fcd261f8c12e7",
    "zh:59fa61b12b201d1e9aa20d81f4b9280c901f7b921fa6eaa5d4dffb7bf61cbf1c",
    "zh:67817734d9eb2bb24e543fd45e71369ca5d363a4b0710bdf28936968cd79fe80",
    "zh:7edaad673f0bbe667f69ac32a66c6b1c7b97a0e15d65eda89292df44df0eab14",
    "zh:7f37e523049115e54dc6372e8606ddd94ca7a447b263bdac88815593c3c8bbba",
    "zh:8a5bd02154951ab11e5ef5a3353ebc167c46d2b62fbb9a61b205d4286545b78c",
    "zh:8a8b49cfd7af06124d85a14bd90940c37e9d9021448f9db74d661e0a43ac1d54",
    "zh:a4f1ce26bd6c2435d6fed2cecfc2878fd81e971602c7c93c6cce1c2489dbfb7b",
    "zh:acc93df983428fb65c5ba3f99e21651cfad6acdf14c13298e020aebe38502023",
    "zh:adeb6b57ef263dda3ca004c012046ca7aaaa8e6bc4fa624a166e627cab55113f",
    "zh:b6477a739c8971da305605272a3f9968f22cc8e0427c58ed341253cc9946c6b5",
    "zh:b83dd1fc0f8af7f99eb7c079cfc92db55904c9ea6899073dca9c119da54fd2f8",
    "zh:dc0a268b0c6a0780e06c4247d4dfc1fa64c958ef9bcc1ead57d397074358d017",
    "zh:dc27c532c662db1599c6a64a0382b582c6a8a56cc081fcca8e76eff0816974b5",
    "zh:eab8f76e61c26c39f4b7313587c882dfd2816894f31b449a5a0c1848ae751035",
  ]
}

provider "registry.opentofu.org/siderolabs/talos" {
  version     = "0.7.1"
  constraints = "~> 0.0, >= 0.5.0"
  hashes = [
    "h1:tzxgHnsmjdkgn82pO+LZAmIOyw6AnbyDyqIB+nl22hY=",
    "zh:0fa82a384b25a58b65523e0ea4768fa1212b1f5cfc0c9379d31162454fedcc9d",
    "zh:162436bf80a53c4bb0e3cd592699129264092c47e2abf01e05cbccfb66ac86de",
    "zh:435b0b7e1dddb51fa40acce72f52ca7d4602ad1995912c51028542a5609bb511",
    "zh:4566884b49adbb94e7b234b572215266eb6807ec668cd49fbe0840b138046bd2",
    "zh:4abf5e1ab2a25740f4ff4e3ecfa57d3fe5c31ed15b4b1d0365227d1f1d32aa40",
    "zh:59884c612645ecd74c25abc83ea87d34a32f737fd261ae291f6ef83c22254bd1",
    "zh:6d3d44db2e87f5b55c321f4b2434d1280df98ce80127ef534a14b28c5e20c54a",
    "zh:73aea54a4283828016463fd8324f8f8fcb0b65e637a80839c719cb3805801062",
    "zh:7f6bcdf202e573a7fd3ff28bce0d02c0d1286db9e23985c3ef476b2580bf5339",
    "zh:8a5fcfe56265be6d996b112dee7d909ae54cf39e8f50b701bc649a37fe546f6b",
    "zh:985113de5713922aab4a1a85edf563669b41c916fdd4c90a7c52f6b3abedb761",
    "zh:9c101adc33fc05042029cb113feb7be811938deefe9dd3db58709f8715084a5e",
    "zh:bdeb34b2d6b6704a2dd8d04321887502f71aeb6c5673ff30f6e8c039b5797630",
    "zh:ce674170f89481e44e20e3f442595104f809cecca666a9703515b28dbcbfc099",
    "zh:f8efb1b8abd656c4a4043bed64c09b8b31698319ce49a187a79bdbb7aef051f3",
  ]
}
