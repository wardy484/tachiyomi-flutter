export const buildDocId = (userId: string, sourceId: string, mangaId: string) => {
    return `${userId}_${sourceId}_${mangaId}`;
};