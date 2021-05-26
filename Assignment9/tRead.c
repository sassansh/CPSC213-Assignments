#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <sys/errno.h>
#include <assert.h>
#include "queue.h"
#include "disk.h"
#include "uthread.h"

queue_t      pending_read_queue;
unsigned int sum = 0;

void interrupt_service_routine () {
  uthread_t tID;

  queue_dequeue(pending_read_queue, (void **) &tID, NULL, NULL);
  uthread_unblock(tID);
}

void* read_block (void* blocknov) {
  //schedule read and the update
  int blockN = *(int *)blocknov;
  int val;

  disk_schedule_read (&val, blockN);
  queue_enqueue(pending_read_queue, uthread_self(), NULL, NULL);
  uthread_block();

  sum = sum + val;

  return NULL;
}

int main (int argc, char** argv) {

  // Command Line Arguments
  static char* usage = "usage: tRead num_blocks";
  int num_blocks;
  char *endptr;
  if (argc == 2)
    num_blocks = strtol (argv [1], &endptr, 10);
  if (argc != 2 || *endptr != 0) {
    printf ("argument error - %s \n", usage);
    return EXIT_FAILURE;
  }

  // Initialize
  uthread_init (1);
  disk_start (interrupt_service_routine);
  pending_read_queue = queue_create();

  // Sum Blocks
  int memThreads = sizeof(uthread_t) * num_blocks;
  uthread_t *myThreads = malloc(memThreads);

  int memBlocks = sizeof(int) * num_blocks;
  int *blocksN = malloc(memBlocks);

  //read blocks
  for(int i = 0; i < num_blocks; i++) {
    blocksN[i] = i;
    myThreads[i] = uthread_create(read_block, &blocksN[i]);
  }

  for(int i = 0; i < num_blocks; i++) {
    uthread_join(myThreads[i], NULL);
  }

  //deallocate memory
  free(blocksN);
  free(myThreads);
  //print sum
  printf("%d\n", sum);
  return 0;
}

