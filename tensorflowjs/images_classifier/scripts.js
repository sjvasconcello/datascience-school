let net;
let count = 0;

const imgEl = document.getElementById('img');
const descEl = document.getElementById("description_imagen")
const webcamElement = document.getElementById("webcam")
const classifeir = knnClassifier.create() // 


async function app() {

    net = await mobilenet.load();

    let result = await net.classify(imgEl);
    console.log(result);
    displayImagePrediction();
 
    webcam = await tf.data.webcam(webcamElement)

    while (true) {
        const img = await webcam.capture();
        const result = await net.classify(img)

        const activation = net.infer(img, "conv_preds");

        var result2;

        try {
            result2 = await classifeir.predicClass(activation)
            const classes = ["Untrained", "Gato","Dino","Alex","OK", "Rock"]
            document.getElementById("console2:" + result2.label)
        } catch(error) {
            console.log("Modelo no configurado")
        }

        document.getElementById("console").innerHTML = "prediction: " + result[0].className + " probability: " + result[0].probability
    }
}

imgEl.onload = async function () {
    displayImagePrediction();
}

async function addExample(classId) {
    console.log("added example")
    const img = await webcam.capture()
    const activation = net.infer(img, true)
    classifeir.addExample(activation, classId)

    img.dispose();

}

async function displayImagePrediction() {
    try {
        result = await net.classify(imgEl);
        descEl.innerHTML = JSON.stringify(result);

        img.dispose(); // ELiminamos el tensor

        await tf.nextFrame(); // Esperamos al siguiente cuadro

    } catch (error) {

    }
}

async function cambiarImagen() {
    count = count + 1
    imgEl.src = "https://picsum.photos/200/300?random=" + count;
}

app();