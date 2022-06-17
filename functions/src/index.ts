import * as functions from "firebase-functions";
import { initializeApp } from "firebase-admin/app";
import { getFirestore } from "firebase-admin/firestore";
import { buildDocId } from "./helpers";

initializeApp();
const db = getFirestore();

export const deleteFavourite = functions.https.onCall(async (data, context) => {
    const userId = context.auth?.uid;

    console.log("User ID: ", userId);
    if (!userId) {
        return;
    }

    const sourceId = data.sourceId;
    const mangaId = data.mangaId;
    const docId = buildDocId(userId, sourceId, mangaId);

    console.log("Doc ID: ", docId);
    
    const chapters = await db.collection("favourites")
        .doc(buildDocId(userId, sourceId, mangaId))
        .collection("chapters") 
        .get();

    chapters.docs.forEach((doc: FirebaseFirestore.DocumentData) => {
        console.log("Deleting chapter: ", doc.id);
        db.collection("favourites")
            .doc(buildDocId(userId, sourceId, mangaId))
            .collection("chapters")
            .doc(doc.id)
            .delete();
    });

    console.log("Complete");
});
  