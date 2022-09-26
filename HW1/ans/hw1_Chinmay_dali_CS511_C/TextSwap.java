// Name: Chinmay Vinod Dali
// CWID: 20012692
// HW assignment 1

import java.io.*;
import java.util.*;

public class TextSwap {

    private static String readFile(String filename) throws Exception {
        String line;
        StringBuilder buffer = new StringBuilder();
        File file = new File(filename);
        BufferedReader br = new BufferedReader(new FileReader(file));
        while ((line = br.readLine()) != null) {
            buffer.append(line);
        }
        br.close();
        return buffer.toString();
    }

    private static Interval[] getIntervals(int numChunks, int chunkSize) {
        Interval[] arrIntervals = new Interval[numChunks];
        for (int i = 0; i < numChunks; i++) {
            Interval aInterval = new Interval(i * chunkSize, (i + 1) * chunkSize - 1);
            arrIntervals[i] = aInterval;
        }
        return arrIntervals;
    }

    private static List<Character> getLabels(int numChunks) {
        Scanner scanner = new Scanner(System.in);
        List<Character> labels = new ArrayList<Character>();
        int endChar = numChunks == 0 ? 'a' : 'a' + numChunks - 1;
        System.out.printf("Input %d character(s) (\'%c\' - \'%c\') for the pattern.\n", numChunks, 'a', endChar);
        for (int i = 0; i < numChunks; i++) {
            labels.add(scanner.next().charAt(0));
        }
        scanner.close();
        return labels;
    }

    private static char[] runSwapper(String content, int chunkSize, int numChunks) throws InterruptedException {
        List<Character> labels = getLabels(numChunks);
        Interval[] intervals = getIntervals(numChunks, chunkSize);
        char[] buffer = new char[content.length()];
        for (int i = 0; i < numChunks; i++) {
            int indexsOfLable = labels.get(i) - 'a';
            if (indexsOfLable >= numChunks) {
                System.out.printf("Index of lable is out of bound");
                return null;
            }

            Thread t1 = new Thread(new Swapper(intervals[indexsOfLable], content, buffer, i * chunkSize));
            t1.start();
            try {
                t1.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
                throw e;
            }
        }
        return buffer;
    }

    private static void writeToFile(String contents, int chunkSize, int numChunks) throws Exception {
        try {
            char[] buff = runSwapper(contents, chunkSize, contents.length() / chunkSize);
            if (buff == null)
                throw new Exception("buffer null");
            PrintWriter writer = new PrintWriter("output.txt", "UTF-8");
            writer.print(buff);
            writer.close();
        } catch (Exception e) {
            System.out.println("Write To File Fail");
            throw e;
        }
    }

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java TextSwap <chunk size> <filename>");
            return;
        }
        String contents = "";
        int chunkSize = Integer.parseInt(args[0]);
        if (chunkSize == 0) {
            System.out.println("Chunk size should be more than 0\n");
            return;
        }
        try {
            contents = readFile(args[1]);
            if (contents.length() / chunkSize > 26) {
                System.out.println("Chunk size too small\n");
                return;
            }
            if (contents.length() / chunkSize == 0) {
                System.out.println("File is empty\n");
                return;
            }
            if (contents.length() % chunkSize != 0) {
                System.out.println("File size must be a multiple of the chunk size\n");
                return;
            }
            writeToFile(contents, chunkSize, contents.length() / chunkSize);
        } catch (Exception e) {
            System.out.println("Error with IO");
            return;
        }
    }
}